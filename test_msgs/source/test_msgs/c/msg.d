module test_msgs.c.msg;

import core.stdc.stdint;
import rcl;

extern (C):
@nogc:
nothrow:
// for Arrays
struct test_msgs__msg__Arrays
{
    bool[3] bool_values;
    uint8_t[3] byte_values;
    uint8_t[3] char_values;
    float[3] float32_values;
    double[3] float64_values;
    int8_t[3] int8_values;
    uint8_t[3] uint8_values;
    int16_t[3] int16_values;
    uint16_t[3] uint16_values;
    int32_t[3] int32_values;
    uint32_t[3] uint32_values;
    int64_t[3] int64_values;
    uint64_t[3] uint64_values;
    rosidl_runtime_c__String[3] string_values;
    test_msgs__msg__BasicTypes[3] basic_types_values;
    test_msgs__msg__Constants[3] constants_values;
    test_msgs__msg__Defaults[3] defaults_values;
    bool[3] bool_values_default;
    uint8_t[3] byte_values_default;
    uint8_t[3] char_values_default;
    float[3] float32_values_default;
    double[3] float64_values_default;
    int8_t[3] int8_values_default;
    uint8_t[3] uint8_values_default;
    int16_t[3] int16_values_default;
    uint16_t[3] uint16_values_default;
    int32_t[3] int32_values_default;
    uint32_t[3] uint32_values_default;
    int64_t[3] int64_values_default;
    uint64_t[3] uint64_values_default;
    rosidl_runtime_c__String[3] string_values_default;
    int32_t alignment_check;
}

struct test_msgs__msg__Arrays__Sequence
{
    test_msgs__msg__Arrays *data;
    size_t size;
    size_t capacity;
}

// for BasicTypes
struct test_msgs__msg__BasicTypes
{
    bool bool_value;
    uint8_t byte_value;
    uint8_t char_value;
    float float32_value;
    double float64_value;
    int8_t int8_value;
    uint8_t uint8_value;
    int16_t int16_value;
    uint16_t uint16_value;
    int32_t int32_value;
    uint32_t uint32_value;
    int64_t int64_value;
    uint64_t uint64_value;
}

struct test_msgs__msg__BasicTypes__Sequence
{
    test_msgs__msg__BasicTypes *data;
    size_t size;
    size_t capacity;
}

// for BoundedSequences
struct test_msgs__msg__BoundedSequences
{
    rosidl_runtime_c__bool__Sequence bool_values;
    rosidl_runtime_c__octet__Sequence byte_values;
    rosidl_runtime_c__uint8__Sequence char_values;
    rosidl_runtime_c__float__Sequence float32_values;
    rosidl_runtime_c__double__Sequence float64_values;
    rosidl_runtime_c__int8__Sequence int8_values;
    rosidl_runtime_c__uint8__Sequence uint8_values;
    rosidl_runtime_c__int16__Sequence int16_values;
    rosidl_runtime_c__uint16__Sequence uint16_values;
    rosidl_runtime_c__int32__Sequence int32_values;
    rosidl_runtime_c__uint32__Sequence uint32_values;
    rosidl_runtime_c__int64__Sequence int64_values;
    rosidl_runtime_c__uint64__Sequence uint64_values;
    rosidl_runtime_c__String__Sequence string_values;
    test_msgs__msg__BasicTypes__Sequence basic_types_values;
    test_msgs__msg__Constants__Sequence constants_values;
    test_msgs__msg__Defaults__Sequence defaults_values;
    rosidl_runtime_c__bool__Sequence bool_values_default;
    rosidl_runtime_c__octet__Sequence byte_values_default;
    rosidl_runtime_c__uint8__Sequence char_values_default;
    rosidl_runtime_c__float__Sequence float32_values_default;
    rosidl_runtime_c__double__Sequence float64_values_default;
    rosidl_runtime_c__int8__Sequence int8_values_default;
    rosidl_runtime_c__uint8__Sequence uint8_values_default;
    rosidl_runtime_c__int16__Sequence int16_values_default;
    rosidl_runtime_c__uint16__Sequence uint16_values_default;
    rosidl_runtime_c__int32__Sequence int32_values_default;
    rosidl_runtime_c__uint32__Sequence uint32_values_default;
    rosidl_runtime_c__int64__Sequence int64_values_default;
    rosidl_runtime_c__uint64__Sequence uint64_values_default;
    rosidl_runtime_c__String__Sequence string_values_default;
    int32_t alignment_check;
}

struct test_msgs__msg__BoundedSequences__Sequence
{
    test_msgs__msg__BoundedSequences *data;
    size_t size;
    size_t capacity;
}

// for Empty
struct test_msgs__msg__Empty
{
    uint8_t structure_needs_at_least_one_member;
}

struct test_msgs__msg__Empty__Sequence
{
    test_msgs__msg__Empty *data;
    size_t size;
    size_t capacity;
}

// for WStrings
struct test_msgs__msg__WStrings
{
    rosidl_runtime_c__U16String wstring_value;
    rosidl_runtime_c__U16String wstring_value_default1;
    rosidl_runtime_c__U16String wstring_value_default2;
    rosidl_runtime_c__U16String wstring_value_default3;
    rosidl_runtime_c__U16String[3] array_of_wstrings;
    rosidl_runtime_c__U16String__Sequence bounded_sequence_of_wstrings;
    rosidl_runtime_c__U16String__Sequence unbounded_sequence_of_wstrings;
}

struct test_msgs__msg__WStrings__Sequence
{
    test_msgs__msg__WStrings *data;
    size_t size;
    size_t capacity;
}

// for MultiNested
struct test_msgs__msg__MultiNested
{
    test_msgs__msg__Arrays[3] array_of_arrays;
    test_msgs__msg__BoundedSequences[3] array_of_bounded_sequences;
    test_msgs__msg__UnboundedSequences[3] array_of_unbounded_sequences;
    test_msgs__msg__Arrays__Sequence bounded_sequence_of_arrays;
    test_msgs__msg__BoundedSequences__Sequence bounded_sequence_of_bounded_sequences;
    test_msgs__msg__UnboundedSequences__Sequence bounded_sequence_of_unbounded_sequences;
    test_msgs__msg__Arrays__Sequence unbounded_sequence_of_arrays;
    test_msgs__msg__BoundedSequences__Sequence unbounded_sequence_of_bounded_sequences;
    test_msgs__msg__UnboundedSequences__Sequence unbounded_sequence_of_unbounded_sequences;
}

struct test_msgs__msg__MultiNested__Sequence
{
    test_msgs__msg__MultiNested *data;
    size_t size;
    size_t capacity;
}

// for Defaults
struct test_msgs__msg__Defaults
{
    bool bool_value;
    uint8_t byte_value;
    uint8_t char_value;
    float float32_value;
    double float64_value;
    int8_t int8_value;
    uint8_t uint8_value;
    int16_t int16_value;
    uint16_t uint16_value;
    int32_t int32_value;
    uint32_t uint32_value;
    int64_t int64_value;
    uint64_t uint64_value;
}

struct test_msgs__msg__Defaults__Sequence
{
    test_msgs__msg__Defaults *data;
    size_t size;
    size_t capacity;
}

// for Nested
struct test_msgs__msg__Nested
{
    test_msgs__msg__BasicTypes basic_types_value;
}

struct test_msgs__msg__Nested__Sequence
{
    test_msgs__msg__Nested *data;
    size_t size;
    size_t capacity;
}

// for Constants
struct test_msgs__msg__Constants
{
    uint8_t structure_needs_at_least_one_member;
}

struct test_msgs__msg__Constants__Sequence
{
    test_msgs__msg__Constants *data;
    size_t size;
    size_t capacity;
}

// for Strings
struct test_msgs__msg__Strings
{
    rosidl_runtime_c__String string_value;
    rosidl_runtime_c__String string_value_default1;
    rosidl_runtime_c__String string_value_default2;
    rosidl_runtime_c__String string_value_default3;
    rosidl_runtime_c__String string_value_default4;
    rosidl_runtime_c__String string_value_default5;
    rosidl_runtime_c__String bounded_string_value;
    rosidl_runtime_c__String bounded_string_value_default1;
    rosidl_runtime_c__String bounded_string_value_default2;
    rosidl_runtime_c__String bounded_string_value_default3;
    rosidl_runtime_c__String bounded_string_value_default4;
    rosidl_runtime_c__String bounded_string_value_default5;
}

struct test_msgs__msg__Strings__Sequence
{
    test_msgs__msg__Strings *data;
    size_t size;
    size_t capacity;
}

// for UnboundedSequences
struct test_msgs__msg__UnboundedSequences
{
    rosidl_runtime_c__bool__Sequence bool_values;
    rosidl_runtime_c__octet__Sequence byte_values;
    rosidl_runtime_c__uint8__Sequence char_values;
    rosidl_runtime_c__float__Sequence float32_values;
    rosidl_runtime_c__double__Sequence float64_values;
    rosidl_runtime_c__int8__Sequence int8_values;
    rosidl_runtime_c__uint8__Sequence uint8_values;
    rosidl_runtime_c__int16__Sequence int16_values;
    rosidl_runtime_c__uint16__Sequence uint16_values;
    rosidl_runtime_c__int32__Sequence int32_values;
    rosidl_runtime_c__uint32__Sequence uint32_values;
    rosidl_runtime_c__int64__Sequence int64_values;
    rosidl_runtime_c__uint64__Sequence uint64_values;
    rosidl_runtime_c__String__Sequence string_values;
    test_msgs__msg__BasicTypes__Sequence basic_types_values;
    test_msgs__msg__Constants__Sequence constants_values;
    test_msgs__msg__Defaults__Sequence defaults_values;
    rosidl_runtime_c__bool__Sequence bool_values_default;
    rosidl_runtime_c__octet__Sequence byte_values_default;
    rosidl_runtime_c__uint8__Sequence char_values_default;
    rosidl_runtime_c__float__Sequence float32_values_default;
    rosidl_runtime_c__double__Sequence float64_values_default;
    rosidl_runtime_c__int8__Sequence int8_values_default;
    rosidl_runtime_c__uint8__Sequence uint8_values_default;
    rosidl_runtime_c__int16__Sequence int16_values_default;
    rosidl_runtime_c__uint16__Sequence uint16_values_default;
    rosidl_runtime_c__int32__Sequence int32_values_default;
    rosidl_runtime_c__uint32__Sequence uint32_values_default;
    rosidl_runtime_c__int64__Sequence int64_values_default;
    rosidl_runtime_c__uint64__Sequence uint64_values_default;
    rosidl_runtime_c__String__Sequence string_values_default;
    int32_t alignment_check;
}

struct test_msgs__msg__UnboundedSequences__Sequence
{
    test_msgs__msg__UnboundedSequences *data;
    size_t size;
    size_t capacity;
}


// for Arrays
bool test_msgs__msg__Arrays__init(test_msgs__msg__Arrays * msg);
void test_msgs__msg__Arrays__fini(test_msgs__msg__Arrays * msg);
test_msgs__msg__Arrays * test_msgs__msg__Arrays__create();
void test_msgs__msg__Arrays__destroy(test_msgs__msg__Arrays * msg);

bool test_msgs__msg__Arrays__Sequence__init(test_msgs__msg__Arrays__Sequence * array, size_t size);
void test_msgs__msg__Arrays__Sequence__fini(test_msgs__msg__Arrays__Sequence * array);
test_msgs__msg__Arrays__Sequence * test_msgs__msg__Arrays__Sequence__create(size_t size);
void test_msgs__msg__Arrays__Sequence__destroy(test_msgs__msg__Arrays__Sequence * array);

// for BasicTypes
bool test_msgs__msg__BasicTypes__init(test_msgs__msg__BasicTypes * msg);
void test_msgs__msg__BasicTypes__fini(test_msgs__msg__BasicTypes * msg);
test_msgs__msg__BasicTypes * test_msgs__msg__BasicTypes__create();
void test_msgs__msg__BasicTypes__destroy(test_msgs__msg__BasicTypes * msg);

bool test_msgs__msg__BasicTypes__Sequence__init(test_msgs__msg__BasicTypes__Sequence * array, size_t size);
void test_msgs__msg__BasicTypes__Sequence__fini(test_msgs__msg__BasicTypes__Sequence * array);
test_msgs__msg__BasicTypes__Sequence * test_msgs__msg__BasicTypes__Sequence__create(size_t size);
void test_msgs__msg__BasicTypes__Sequence__destroy(test_msgs__msg__BasicTypes__Sequence * array);

// for BoundedSequences
bool test_msgs__msg__BoundedSequences__init(test_msgs__msg__BoundedSequences * msg);
void test_msgs__msg__BoundedSequences__fini(test_msgs__msg__BoundedSequences * msg);
test_msgs__msg__BoundedSequences * test_msgs__msg__BoundedSequences__create();
void test_msgs__msg__BoundedSequences__destroy(test_msgs__msg__BoundedSequences * msg);

bool test_msgs__msg__BoundedSequences__Sequence__init(test_msgs__msg__BoundedSequences__Sequence * array, size_t size);
void test_msgs__msg__BoundedSequences__Sequence__fini(test_msgs__msg__BoundedSequences__Sequence * array);
test_msgs__msg__BoundedSequences__Sequence * test_msgs__msg__BoundedSequences__Sequence__create(size_t size);
void test_msgs__msg__BoundedSequences__Sequence__destroy(test_msgs__msg__BoundedSequences__Sequence * array);

// for Empty
bool test_msgs__msg__Empty__init(test_msgs__msg__Empty * msg);
void test_msgs__msg__Empty__fini(test_msgs__msg__Empty * msg);
test_msgs__msg__Empty * test_msgs__msg__Empty__create();
void test_msgs__msg__Empty__destroy(test_msgs__msg__Empty * msg);

bool test_msgs__msg__Empty__Sequence__init(test_msgs__msg__Empty__Sequence * array, size_t size);
void test_msgs__msg__Empty__Sequence__fini(test_msgs__msg__Empty__Sequence * array);
test_msgs__msg__Empty__Sequence * test_msgs__msg__Empty__Sequence__create(size_t size);
void test_msgs__msg__Empty__Sequence__destroy(test_msgs__msg__Empty__Sequence * array);

// for WStrings
bool test_msgs__msg__WStrings__init(test_msgs__msg__WStrings * msg);
void test_msgs__msg__WStrings__fini(test_msgs__msg__WStrings * msg);
test_msgs__msg__WStrings * test_msgs__msg__WStrings__create();
void test_msgs__msg__WStrings__destroy(test_msgs__msg__WStrings * msg);

bool test_msgs__msg__WStrings__Sequence__init(test_msgs__msg__WStrings__Sequence * array, size_t size);
void test_msgs__msg__WStrings__Sequence__fini(test_msgs__msg__WStrings__Sequence * array);
test_msgs__msg__WStrings__Sequence * test_msgs__msg__WStrings__Sequence__create(size_t size);
void test_msgs__msg__WStrings__Sequence__destroy(test_msgs__msg__WStrings__Sequence * array);

// for MultiNested
bool test_msgs__msg__MultiNested__init(test_msgs__msg__MultiNested * msg);
void test_msgs__msg__MultiNested__fini(test_msgs__msg__MultiNested * msg);
test_msgs__msg__MultiNested * test_msgs__msg__MultiNested__create();
void test_msgs__msg__MultiNested__destroy(test_msgs__msg__MultiNested * msg);

bool test_msgs__msg__MultiNested__Sequence__init(test_msgs__msg__MultiNested__Sequence * array, size_t size);
void test_msgs__msg__MultiNested__Sequence__fini(test_msgs__msg__MultiNested__Sequence * array);
test_msgs__msg__MultiNested__Sequence * test_msgs__msg__MultiNested__Sequence__create(size_t size);
void test_msgs__msg__MultiNested__Sequence__destroy(test_msgs__msg__MultiNested__Sequence * array);

// for Defaults
bool test_msgs__msg__Defaults__init(test_msgs__msg__Defaults * msg);
void test_msgs__msg__Defaults__fini(test_msgs__msg__Defaults * msg);
test_msgs__msg__Defaults * test_msgs__msg__Defaults__create();
void test_msgs__msg__Defaults__destroy(test_msgs__msg__Defaults * msg);

bool test_msgs__msg__Defaults__Sequence__init(test_msgs__msg__Defaults__Sequence * array, size_t size);
void test_msgs__msg__Defaults__Sequence__fini(test_msgs__msg__Defaults__Sequence * array);
test_msgs__msg__Defaults__Sequence * test_msgs__msg__Defaults__Sequence__create(size_t size);
void test_msgs__msg__Defaults__Sequence__destroy(test_msgs__msg__Defaults__Sequence * array);

// for Nested
bool test_msgs__msg__Nested__init(test_msgs__msg__Nested * msg);
void test_msgs__msg__Nested__fini(test_msgs__msg__Nested * msg);
test_msgs__msg__Nested * test_msgs__msg__Nested__create();
void test_msgs__msg__Nested__destroy(test_msgs__msg__Nested * msg);

bool test_msgs__msg__Nested__Sequence__init(test_msgs__msg__Nested__Sequence * array, size_t size);
void test_msgs__msg__Nested__Sequence__fini(test_msgs__msg__Nested__Sequence * array);
test_msgs__msg__Nested__Sequence * test_msgs__msg__Nested__Sequence__create(size_t size);
void test_msgs__msg__Nested__Sequence__destroy(test_msgs__msg__Nested__Sequence * array);

// for Constants
bool test_msgs__msg__Constants__init(test_msgs__msg__Constants * msg);
void test_msgs__msg__Constants__fini(test_msgs__msg__Constants * msg);
test_msgs__msg__Constants * test_msgs__msg__Constants__create();
void test_msgs__msg__Constants__destroy(test_msgs__msg__Constants * msg);

bool test_msgs__msg__Constants__Sequence__init(test_msgs__msg__Constants__Sequence * array, size_t size);
void test_msgs__msg__Constants__Sequence__fini(test_msgs__msg__Constants__Sequence * array);
test_msgs__msg__Constants__Sequence * test_msgs__msg__Constants__Sequence__create(size_t size);
void test_msgs__msg__Constants__Sequence__destroy(test_msgs__msg__Constants__Sequence * array);

// for Strings
bool test_msgs__msg__Strings__init(test_msgs__msg__Strings * msg);
void test_msgs__msg__Strings__fini(test_msgs__msg__Strings * msg);
test_msgs__msg__Strings * test_msgs__msg__Strings__create();
void test_msgs__msg__Strings__destroy(test_msgs__msg__Strings * msg);

bool test_msgs__msg__Strings__Sequence__init(test_msgs__msg__Strings__Sequence * array, size_t size);
void test_msgs__msg__Strings__Sequence__fini(test_msgs__msg__Strings__Sequence * array);
test_msgs__msg__Strings__Sequence * test_msgs__msg__Strings__Sequence__create(size_t size);
void test_msgs__msg__Strings__Sequence__destroy(test_msgs__msg__Strings__Sequence * array);

// for UnboundedSequences
bool test_msgs__msg__UnboundedSequences__init(test_msgs__msg__UnboundedSequences * msg);
void test_msgs__msg__UnboundedSequences__fini(test_msgs__msg__UnboundedSequences * msg);
test_msgs__msg__UnboundedSequences * test_msgs__msg__UnboundedSequences__create();
void test_msgs__msg__UnboundedSequences__destroy(test_msgs__msg__UnboundedSequences * msg);

bool test_msgs__msg__UnboundedSequences__Sequence__init(test_msgs__msg__UnboundedSequences__Sequence * array, size_t size);
void test_msgs__msg__UnboundedSequences__Sequence__fini(test_msgs__msg__UnboundedSequences__Sequence * array);
test_msgs__msg__UnboundedSequences__Sequence * test_msgs__msg__UnboundedSequences__Sequence__create(size_t size);
void test_msgs__msg__UnboundedSequences__Sequence__destroy(test_msgs__msg__UnboundedSequences__Sequence * array);


const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Arrays();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__BasicTypes();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__BoundedSequences();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Empty();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__WStrings();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__MultiNested();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Defaults();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Nested();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Constants();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__Strings();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__msg__UnboundedSequences();



