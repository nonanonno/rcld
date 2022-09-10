module test_msgs.c.srv;

import core.stdc.stdint;
import rcl;
import test_msgs.c.msg;

extern (C):
@nogc:
nothrow:
// for Arrays_Request
struct test_msgs__srv__Arrays_Request
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
}

struct test_msgs__srv__Arrays_Request__Sequence
{
    test_msgs__srv__Arrays_Request *data;
    size_t size;
    size_t capacity;
}

// for Arrays_Response
struct test_msgs__srv__Arrays_Response
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
}

struct test_msgs__srv__Arrays_Response__Sequence
{
    test_msgs__srv__Arrays_Response *data;
    size_t size;
    size_t capacity;
}

// for BasicTypes_Request
struct test_msgs__srv__BasicTypes_Request
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
    rosidl_runtime_c__String string_value;
}

struct test_msgs__srv__BasicTypes_Request__Sequence
{
    test_msgs__srv__BasicTypes_Request *data;
    size_t size;
    size_t capacity;
}

// for BasicTypes_Response
struct test_msgs__srv__BasicTypes_Response
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
    rosidl_runtime_c__String string_value;
}

struct test_msgs__srv__BasicTypes_Response__Sequence
{
    test_msgs__srv__BasicTypes_Response *data;
    size_t size;
    size_t capacity;
}

// for Empty_Request
struct test_msgs__srv__Empty_Request
{
    uint8_t structure_needs_at_least_one_member;
}

struct test_msgs__srv__Empty_Request__Sequence
{
    test_msgs__srv__Empty_Request *data;
    size_t size;
    size_t capacity;
}

// for Empty_Response
struct test_msgs__srv__Empty_Response
{
    uint8_t structure_needs_at_least_one_member;
}

struct test_msgs__srv__Empty_Response__Sequence
{
    test_msgs__srv__Empty_Response *data;
    size_t size;
    size_t capacity;
}


// for Arrays_Request
bool test_msgs__srv__Arrays_Request__init(test_msgs__srv__Arrays_Request * msg);
void test_msgs__srv__Arrays_Request__fini(test_msgs__srv__Arrays_Request * msg);
test_msgs__srv__Arrays_Request * test_msgs__srv__Arrays_Request__create();
void test_msgs__srv__Arrays_Request__destroy(test_msgs__srv__Arrays_Request * msg);

bool test_msgs__srv__Arrays_Request__Sequence__init(test_msgs__srv__Arrays_Request__Sequence * array, size_t size);
void test_msgs__srv__Arrays_Request__Sequence__fini(test_msgs__srv__Arrays_Request__Sequence * array);
test_msgs__srv__Arrays_Request__Sequence * test_msgs__srv__Arrays_Request__Sequence__create(size_t size);
void test_msgs__srv__Arrays_Request__Sequence__destroy(test_msgs__srv__Arrays_Request__Sequence * array);

// for Arrays_Response
bool test_msgs__srv__Arrays_Response__init(test_msgs__srv__Arrays_Response * msg);
void test_msgs__srv__Arrays_Response__fini(test_msgs__srv__Arrays_Response * msg);
test_msgs__srv__Arrays_Response * test_msgs__srv__Arrays_Response__create();
void test_msgs__srv__Arrays_Response__destroy(test_msgs__srv__Arrays_Response * msg);

bool test_msgs__srv__Arrays_Response__Sequence__init(test_msgs__srv__Arrays_Response__Sequence * array, size_t size);
void test_msgs__srv__Arrays_Response__Sequence__fini(test_msgs__srv__Arrays_Response__Sequence * array);
test_msgs__srv__Arrays_Response__Sequence * test_msgs__srv__Arrays_Response__Sequence__create(size_t size);
void test_msgs__srv__Arrays_Response__Sequence__destroy(test_msgs__srv__Arrays_Response__Sequence * array);

// for BasicTypes_Request
bool test_msgs__srv__BasicTypes_Request__init(test_msgs__srv__BasicTypes_Request * msg);
void test_msgs__srv__BasicTypes_Request__fini(test_msgs__srv__BasicTypes_Request * msg);
test_msgs__srv__BasicTypes_Request * test_msgs__srv__BasicTypes_Request__create();
void test_msgs__srv__BasicTypes_Request__destroy(test_msgs__srv__BasicTypes_Request * msg);

bool test_msgs__srv__BasicTypes_Request__Sequence__init(test_msgs__srv__BasicTypes_Request__Sequence * array, size_t size);
void test_msgs__srv__BasicTypes_Request__Sequence__fini(test_msgs__srv__BasicTypes_Request__Sequence * array);
test_msgs__srv__BasicTypes_Request__Sequence * test_msgs__srv__BasicTypes_Request__Sequence__create(size_t size);
void test_msgs__srv__BasicTypes_Request__Sequence__destroy(test_msgs__srv__BasicTypes_Request__Sequence * array);

// for BasicTypes_Response
bool test_msgs__srv__BasicTypes_Response__init(test_msgs__srv__BasicTypes_Response * msg);
void test_msgs__srv__BasicTypes_Response__fini(test_msgs__srv__BasicTypes_Response * msg);
test_msgs__srv__BasicTypes_Response * test_msgs__srv__BasicTypes_Response__create();
void test_msgs__srv__BasicTypes_Response__destroy(test_msgs__srv__BasicTypes_Response * msg);

bool test_msgs__srv__BasicTypes_Response__Sequence__init(test_msgs__srv__BasicTypes_Response__Sequence * array, size_t size);
void test_msgs__srv__BasicTypes_Response__Sequence__fini(test_msgs__srv__BasicTypes_Response__Sequence * array);
test_msgs__srv__BasicTypes_Response__Sequence * test_msgs__srv__BasicTypes_Response__Sequence__create(size_t size);
void test_msgs__srv__BasicTypes_Response__Sequence__destroy(test_msgs__srv__BasicTypes_Response__Sequence * array);

// for Empty_Request
bool test_msgs__srv__Empty_Request__init(test_msgs__srv__Empty_Request * msg);
void test_msgs__srv__Empty_Request__fini(test_msgs__srv__Empty_Request * msg);
test_msgs__srv__Empty_Request * test_msgs__srv__Empty_Request__create();
void test_msgs__srv__Empty_Request__destroy(test_msgs__srv__Empty_Request * msg);

bool test_msgs__srv__Empty_Request__Sequence__init(test_msgs__srv__Empty_Request__Sequence * array, size_t size);
void test_msgs__srv__Empty_Request__Sequence__fini(test_msgs__srv__Empty_Request__Sequence * array);
test_msgs__srv__Empty_Request__Sequence * test_msgs__srv__Empty_Request__Sequence__create(size_t size);
void test_msgs__srv__Empty_Request__Sequence__destroy(test_msgs__srv__Empty_Request__Sequence * array);

// for Empty_Response
bool test_msgs__srv__Empty_Response__init(test_msgs__srv__Empty_Response * msg);
void test_msgs__srv__Empty_Response__fini(test_msgs__srv__Empty_Response * msg);
test_msgs__srv__Empty_Response * test_msgs__srv__Empty_Response__create();
void test_msgs__srv__Empty_Response__destroy(test_msgs__srv__Empty_Response * msg);

bool test_msgs__srv__Empty_Response__Sequence__init(test_msgs__srv__Empty_Response__Sequence * array, size_t size);
void test_msgs__srv__Empty_Response__Sequence__fini(test_msgs__srv__Empty_Response__Sequence * array);
test_msgs__srv__Empty_Response__Sequence * test_msgs__srv__Empty_Response__Sequence__create(size_t size);
void test_msgs__srv__Empty_Response__Sequence__destroy(test_msgs__srv__Empty_Response__Sequence * array);


const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__Arrays_Request();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__Arrays_Response();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__BasicTypes_Request();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__BasicTypes_Response();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__Empty_Request();
const(rosidl_message_type_support_t) * rosidl_typesupport_c__get_message_type_support_handle__test_msgs__srv__Empty_Response();

const(rosidl_service_type_support_t) * rosidl_typesupport_c__get_service_type_support_handle__test_msgs__srv__Arrays();
const(rosidl_service_type_support_t) * rosidl_typesupport_c__get_service_type_support_handle__test_msgs__srv__BasicTypes();
const(rosidl_service_type_support_t) * rosidl_typesupport_c__get_service_type_support_handle__test_msgs__srv__Empty();


