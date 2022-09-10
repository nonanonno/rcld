module msg_gen.solver;

import rosidl_parser;
import std.algorithm;
import std.array;
import std.format;
import std.string;

version (unittest) import dshould;

// dfmt off
private enum basicTypeToDType = [ // @suppress(dscanner.performance.enum_array_literal)
    "short"              : "short",
    "long"               : "int",
    "long long"          : "long",
    "unsigned short"     : "ushort",
    "unsigned long"      : "uint",
    "unsigned long long" : "ulong",
    "float"              : "float",
    "double"             : "double",
    "long double"        : "real",
    "char"               : "char",
    "wchar"              : "wchar",
    "boolean"            : "bool",
    "octet"              : "ubyte",
    "int8"               : "byte",
    "int16"              : "short",
    "int32"              : "int",
    "int64"              : "long",
    "uint8"              : "ubyte",
    "uint16"             : "ushort",
    "uint32"             : "uint",
    "uint64"             : "ulong",
];
// dfmt on

// dfmt off
private enum basicTypeToCType = [ // @suppress(dscanner.performance.enum_array_literal)
    "short"              : "int16_t",
    "long"               : "int32_t",
    "long long"          : "int64_t",
    "unsigned short"     : "uint16_t",
    "unsigned long"      : "uint32_t",
    "unsigned long long" : "uint64_t",
    "float"              : "float",
    "double"             : "double",
    "long double"        : "long double",
    "char"               : "char",
    "wchar"              : "uint16_t",
    "boolean"            : "bool",
    "octet"              : "uint8_t",
    "int8"               : "int8_t",
    "int16"              : "int16_t",
    "int32"              : "int32_t",
    "int64"              : "int64_t",
    "uint8"              : "uint8_t",
    "uint16"             : "uint16_t",
    "uint32"             : "uint32_t",
    "uint64"             : "uint64_t",
];
// dfmt on

// dfmt off
private enum basicTypeToIDLType = [ // @suppress(dscanner.performance.enum_array_literal)
    "short"              : "int16",
    "long"               : "int32",
    "long long"          : "int64",
    "unsigned short"     : "uint16",
    "unsigned long"      : "uint32",
    "unsigned long long" : "uint64",
    "float"              : "float",
    "double"             : "double",
    "long double"        : "long_double",
    "char"               : "char",
    "wchar"              : "uint16",
    "boolean"            : "bool",
    "octet"              : "octet",
    "int8"               : "int8",
    "int16"              : "int16",
    "int32"              : "int32",
    "int64"              : "int64",
    "uint8"              : "uint8",
    "uint16"             : "uint16",
    "uint32"             : "uint32",
    "uint64"             : "uint64",
];
// dfmt on

string toDTypeName(in AbstractType type)
{
    // dfmt off
    return (cast(AbstractType) type).castSwitch!(
        (in BasicType t)         => basicTypeToDType[t.name],
        (in NamedType t)         => t.name,
        (in NamespacedType t)    => t.joinedName("."),
        (in BoundedString t)     => "string", // TODO: Support bounded type
        (in UnboundedString t)   => "string",
        (in BoundedWString t)    => "wstring", // TODO: Support bounded type
        (in UnboundedWString t)  => "wstring",
        (in ArrayType t)         => t.valueType.toDTypeName ~ "[" ~ t.size ~ "]",
        (in BoundedSequence t)   => t.valueType.toDTypeName ~ "[]", // TODO: Support bounded type
        (in UnboundedSequence t) => t.valueType.toDTypeName ~ "[]",
    );
    // dfmt on
}

@("toDTypeName") unittest
{
    AbstractNestableType short_ = new BasicType("short");
    AbstractNestableType myMessage = new NamespacedType(["pkgname", "msg"], "MyMessage");

    assert(toDTypeName(short_) == "short");
    assert(toDTypeName(new NamedType("MyMessage")) == "MyMessage");
    assert(toDTypeName(myMessage) == "pkgname.msg.MyMessage");
    assert(toDTypeName(new BoundedString("123")) == "string");
    assert(toDTypeName(new UnboundedString()) == "string");
    assert(toDTypeName(new BoundedWString("123")) == "wstring");
    assert(toDTypeName(new UnboundedWString()) == "wstring");
    assert(toDTypeName(new ArrayType(short_, "3")) == "short[3]");
    assert(toDTypeName(new BoundedSequence(short_, "3")) == "short[]");
    assert(toDTypeName(new UnboundedSequence(short_)) == "short[]");
    assert(toDTypeName(new UnboundedSequence(myMessage)) == "pkgname.msg.MyMessage[]");
}

string toCTypeName(in AbstractType type)
{
    string toSequenceType(in AbstractSequence t)
    {
        if (auto b = cast(const(BasicType)) t.valueType)
        {
            return "rosidl_runtime_c__" ~ basicTypeToIDLType[b.name] ~ "__Sequence";
        }
        else
        {
            return t.valueType.toCTypeName ~ "__Sequence";
        }
    }

    // dfmt off
    return (cast(AbstractType) type).castSwitch!(
        (in BasicType t)        => basicTypeToCType[t.name],
        (in NamedType t)        => t.name,
        (in NamespacedType t)   => t.joinedName("__"),
        (in BoundedString _)    => "rosidl_runtime_c__String",
        (in UnboundedString _)  => "rosidl_runtime_c__String",
        (in BoundedWString _)   => "rosidl_runtime_c__U16String",
        (in UnboundedWString _) => "rosidl_runtime_c__U16String",
        (in ArrayType t)        => t.valueType.toCTypeName ~ "[" ~ t.size ~ "]",
        (in BoundedSequence t)  => toSequenceType(t),
        (in UnboundedSequence t)  => toSequenceType(t),
    );
    // dfmt on
}

@("toCTypeName") unittest
{
    AbstractNestableType short_ = new BasicType("short");
    AbstractNestableType myMessage = new NamespacedType(["pkgname", "msg"], "MyMessage");

    assert(toCTypeName(short_) == "int16_t");
    assert(toCTypeName(new NamedType("MyMessage")) == "MyMessage");
    assert(toCTypeName(myMessage) == "pkgname__msg__MyMessage");
    assert(toCTypeName(new BoundedString("123")) == "rosidl_runtime_c__String");
    assert(toCTypeName(new UnboundedString()) == "rosidl_runtime_c__String");
    assert(toCTypeName(new BoundedWString("123")) == "rosidl_runtime_c__U16String");
    assert(toCTypeName(new UnboundedWString()) == "rosidl_runtime_c__U16String");
    assert(toCTypeName(new ArrayType(short_, "3")) == "int16_t[3]");
    assert(toCTypeName(new BoundedSequence(short_, "3")) == "rosidl_runtime_c__int16__Sequence");
    assert(toCTypeName(new UnboundedSequence(short_)) == "rosidl_runtime_c__int16__Sequence");
    assert(toCTypeName(new UnboundedSequence(myMessage)) == "pkgname__msg__MyMessage__Sequence");
}

AbstractType solveType(in string[] namespaces, const(AbstractType) type, const(
        AbstractType[AbstractType]) map)
{
    if (auto named = cast(NamedType) type)
    {
        auto namespaced = new NamespacedType(namespaces, named.name);
        if (namespaced in map)
        {
            return solveType(namespaces, map[namespaced], map);
        }
        else
        {
            return cast(AbstractType) type;
        }
    }
    else if (auto namespaced = cast(NamespacedType) type)
    {
        if ((cast(AbstractType) type) in map)
        {
            return solveType(namespaces, map[namespaced], map);
        }
        else
        {
            return cast(AbstractType) type;
        }
    }
    else if (auto nested = cast(AbstractNestedType) type)
    {
        auto solved = cast(AbstractNestableType) solveType(namespaces, cast(AbstractType) nested.valueType, map);
        return nested.castSwitch!(
            (in ArrayType t) => cast(AbstractType) new ArrayType(solved, t.size),
            (in BoundedSequence t) => cast(AbstractType) new BoundedSequence(solved, t
                .maximumSize),
            (in UnboundedSequence t) => cast(AbstractType) new UnboundedSequence(solved),
        );
    }
    else
    {
        return cast(AbstractType) type;
    }
}

@("solveType") unittest
{

    auto nst(string[] ns, string name)
    {
        return new NamespacedType(ns, name);
    }

    auto nt(string name)
    {
        return new NamedType(name);
    }

    auto bt(string name)
    {
        return new BasicType(name);
    }

    auto at(T)(T valueType, string size)
    {
        return new ArrayType(valueType, size);
    }

    auto ns = ["test_msgs", "msg"];

    AbstractType[AbstractType] map = [
        nst(ns, "boolean__3"): at(bt("boolean"), "3"),
        nst(ns, "test_msgs__msg__BasicTypes"): nst(ns, "BasicTypes"),
        nst(ns, "test_msgs__msg__BasicTypes__3"): at(nt("test_msgs__msg__BasicTypes"), "3"),
    ];

    assert(solveType(["test_msgs", "msg"], bt("float"), map) == bt("float"));
    assert(solveType(["test_msgs", "msg"], nt("boolean__3"), map) == at(bt("boolean"), "3"));
    assert(solveType(["test_msgs", "msg"], nt("test_msgs__msg__BasicTypes__3"), map) == at(nst(ns, "BasicTypes"), "3"));
}

string createAssignFmtDtoC(in AbstractType type)
{
    // [src, dst]
    // dfmt off
    string nestable(in AbstractNestableType nestableType, string srcSuffix = "", string dstSuffix = "")
    {
        auto src = "src.%1$s" ~ srcSuffix;
        auto dst = "dst.%2$s" ~ dstSuffix;

        return (cast(AbstractNestableType) nestableType).castSwitch!(
            (in BasicType t)       => dst ~ " = " ~ src,
            (in NamedType t)       => t.toDTypeName ~ ".convert(" ~ src ~ ", " ~ dst ~ ")",
            (in NamespacedType t)  => t.toDTypeName ~ ".convert(" ~ src ~ ", " ~ dst ~ ")",
            (in AbstractString t)  => "rosidl_runtime_c__String__assign(&" ~ dst ~ ", toStringz(" ~ src ~ "))",
            (in AbstractWString t) => "rosidl_runtime_c__U16String__assign(&" ~ dst ~ ", cast(const(ushort*))toUTF16z(" ~ src ~ "))", // @suppress(dscanner.style.long_line)
        );
    }

    return (cast(AbstractType) type).castSwitch!(
        (in AbstractNestableType t) => nestable(t) ~ ";",
        (in ArrayType t)        => "foreach(i;0U..src.%1$s.length) { " ~ nestable(t.valueType, "[i]", "[i]") ~ "; }",
        (in AbstractSequence t) => t.toCTypeName ~ "__init(&dst.%2$s, src.%1$s.length); foreach(i;0U..src.%1$s.length) { " ~ nestable(t.valueType, "[i]", ".data[i]") ~ "; }", // @suppress(dscanner.style.long_line)
    );
    // dfmt on
}

@("createAssignFmtDtoC") unittest
{
    AbstractNestableType short_ = new BasicType("short");
    AbstractNestableType myMessage = new NamespacedType(["pkgname", "msg"], "MyMessage");

    void assertImpl(AbstractType type, string reference)
    {
        import std.format;

        auto tmp = type.createAssignFmtDtoC.format("a", "b");
        assert(tmp == reference, tmp);
    }

    assertImpl(short_, "dst.b = src.a;");
    assertImpl(new NamedType("MyMessage"), "MyMessage.convert(src.a, dst.b);");
    assertImpl(myMessage, "pkgname.msg.MyMessage.convert(src.a, dst.b);");
    assertImpl(new BoundedString("123"), "rosidl_runtime_c__String__assign(&dst.b, toStringz(src.a));");
    assertImpl(new UnboundedString(), "rosidl_runtime_c__String__assign(&dst.b, toStringz(src.a));");
    assertImpl(new BoundedWString("123"),
        "rosidl_runtime_c__U16String__assign(&dst.b, cast(const(ushort*))toUTF16z(src.a));");
    assertImpl(new UnboundedWString(),
        "rosidl_runtime_c__U16String__assign(&dst.b, cast(const(ushort*))toUTF16z(src.a));");
    assertImpl(new ArrayType(short_, "3"), "foreach(i;0U..src.a.length) { dst.b[i] = src.a[i]; }");
    assertImpl(new BoundedSequence(short_, "3"),
        "rosidl_runtime_c__int16__Sequence__init(&dst.b, src.a.length); foreach(i;0U..src.a.length) { dst.b.data[i] = src.a[i]; }"); // @suppress(dscanner.style.long_line)
    assertImpl(new UnboundedSequence(short_),
        "rosidl_runtime_c__int16__Sequence__init(&dst.b, src.a.length); foreach(i;0U..src.a.length) { dst.b.data[i] = src.a[i]; }"); // @suppress(dscanner.style.long_line)
}

string createAssignFmtCtoD(in AbstractType type)
{
    // [src, dst]
    // dfmt off
    string nestable(in AbstractNestableType nestableType, string srcSuffix = "", string dstSuffix = "")
    {
        auto src = "src.%1$s" ~ srcSuffix;
        auto dst = "dst.%2$s" ~ dstSuffix;

        return (cast(AbstractNestableType) nestableType).castSwitch!(
            (in BasicType t)       => dst ~ " = " ~ src,
            (in NamedType t)       => t.toDTypeName ~ ".convert(" ~ src ~ ", " ~ dst ~ ")",
            (in NamespacedType t)  => t.toDTypeName ~ ".convert(" ~ src ~ ", " ~ dst ~ ")",
            (in AbstractString t)  => dst ~ " = fromStringz(" ~ src ~ ".data).dup()",
            (in AbstractWString t) => dst ~ " = fromStringz(cast(const(wchar*))" ~ src ~ ".data).dup()",
        );
    }

    return (cast(AbstractType) type).castSwitch!(
        (in AbstractNestableType t) => nestable(t) ~ ";",
        (in ArrayType t)        => "foreach(i;0U..dst.%2$s.length) { " ~ nestable(t.valueType, "[i]", "[i]") ~ "; }",
        (in AbstractSequence t) => "dst.%2$s.length = src.%1$s.size; foreach(i;0U..dst.%2$s.length) { " ~ nestable(t.valueType, ".data[i]", "[i]") ~ "; }", // @suppress(dscanner.style.long_line)
    );
    // dfmt on
}

@("createAssignFmtCtoD") unittest
{
    AbstractNestableType short_ = new BasicType("short");
    AbstractNestableType myMessage = new NamespacedType(["pkgname", "msg"], "MyMessage");

    void assertImpl(AbstractType type, string reference)
    {
        import std.format;

        auto tmp = type.createAssignFmtCtoD.format("a", "b");
        assert(tmp == reference, tmp);
    }

    assertImpl(short_, "dst.b = src.a;");
    assertImpl(new NamedType("MyMessage"), "MyMessage.convert(src.a, dst.b);");
    assertImpl(myMessage, "pkgname.msg.MyMessage.convert(src.a, dst.b);");
    assertImpl(new BoundedString("123"), "dst.b = fromStringz(src.a.data).dup();");
    assertImpl(new UnboundedString(), "dst.b = fromStringz(src.a.data).dup();");
    assertImpl(new BoundedWString("123"), "dst.b = fromStringz(cast(const(wchar*))src.a.data).dup();");
    assertImpl(new UnboundedWString(), "dst.b = fromStringz(cast(const(wchar*))src.a.data).dup();");
    assertImpl(new ArrayType(short_, "3"), "foreach(i;0U..dst.b.length) { dst.b[i] = src.a[i]; }");
    assertImpl(new BoundedSequence(short_, "3"),
        "dst.b.length = src.a.size; foreach(i;0U..dst.b.length) { dst.b[i] = src.a.data[i]; }");
    assertImpl(new UnboundedSequence(short_),
        "dst.b.length = src.a.size; foreach(i;0U..dst.b.length) { dst.b[i] = src.a.data[i]; }");
}

string[] makeUniqueModules(const(Include)[] includes, string[] ignoreList)
{
    return includes
        .map!(i => i.locator[1 .. $ - 1]) // trim bracket
        .map!(i => i.split('/')[0 .. $ - 1].join('.')) // get module name
        .array // to array to sort
        .sort // sort to apply uniq
        .uniq // get uniq
        .filter!(i => !ignoreList.canFind(i)) // delete items appeared in ignoreList
        .array; // to array
}

@("makeUniqueModules") unittest
{
    assert(makeUniqueModules([
            Include(`"pkgname/msg/MyMessage.idl"`),
            Include(`"pkgname/msg/MyMessage2.idl"`),
            Include(`"this/msg/MyMessage.idl"`)
        ], ["this.msg"]) == ["pkgname.msg"]);
}

string[] makeUnuquePackages(const(Include)[] includes, string[] ignoreList)
{
    return includes
        .map!(i => i.locator[1 .. $ - 1]) // trim bracket
        .map!(i => i.split('/')[0]) // get package name
        .array
        .sort
        .uniq
        .filter!(i => !ignoreList.canFind(i))
        .array;
}

@("makeUniquePackages") unittest
{
    assert(makeUnuquePackages([
            Include(`"pkgname/msg/MyMessage.idl"`),
            Include(`"pkgname/msg/MyMessage2.idl"`),
            Include(`"pkgname/srv/MyService.idl"`),
            Include(`"this/msg/MyMessage.idl"`),
        ], ["this"]) == ["pkgname"]);

}

string solveLiteral(string value)
{
    auto stripped = value.strip;

    if (stripped.startsWith(`"(`))
    {
        return solveArrayLiteral(stripped);
    }

    if (stripped.startsWith("'"))
    {

        stripped = stripped.replace(`"`, `\"`);
        stripped = stripped.replace(`'`, `"`);
        stripped = stripped.replace(`\'`, `'`);
        return stripped;
    }

    switch (stripped)
    {
    case "TRUE", "True":
        return "true";
    case "FALSE", "False":
        return "false";
    default:
        return stripped;
    }
}

string solveArrayLiteral(string value)
{
    value = value[2 .. $ - 2];
    auto values = value.split(",");

    return format("[%-(%s, %)]", values.map!(v => solveLiteral(v)).array);
}

unittest
{
    solveLiteral(`TRUE`).should.be("true");
    solveLiteral(`True`).should.be("true");
    solveLiteral(`FALSE`).should.be("false");
    solveLiteral(`False`).should.be("false");
    solveLiteral(`"Hello world!"`).should.be(`"Hello world!"`);
    solveLiteral(`"Hello'world!"`).should.be(`"Hello'world!"`);
    solveLiteral(`"Hello\"world!"`).should.be(`"Hello\"world!"`);
    solveLiteral(`"(False, True, False)"`).should.be("[false, true, false]");
    solveLiteral(`"(0, 1, 255)"`).should.be("[0, 1, 255]");
    solveLiteral(`"('', 'max value', 'min value')"`).should.be(`["", "max value", "min value"]`);
}
