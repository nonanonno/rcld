module statistics_msgs.msg.foxy;
version (foxy)
{

    import std.string;
    import std.utf;
    import rcl;
    import builtin_interfaces.msg;

    struct StatisticDataType
    {
        ubyte structure_needs_at_least_one_member;

        enum ubyte STATISTICS_DATA_TYPE_UNINITIALIZED = 0;
        enum ubyte STATISTICS_DATA_TYPE_AVERAGE = 1;
        enum ubyte STATISTICS_DATA_TYPE_MINIMUM = 2;
        enum ubyte STATISTICS_DATA_TYPE_MAXIMUM = 3;
        enum ubyte STATISTICS_DATA_TYPE_STDDEV = 4;
        enum ubyte STATISTICS_DATA_TYPE_SAMPLE_COUNT = 5;

        alias CType = statistics_msgs__msg__StatisticDataType;
        alias CArrayType = statistics_msgs__msg__StatisticDataType__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__statistics_msgs__msg__StatisticDataType();
        }

        static CType* createC() @nogc nothrow
        {
            return statistics_msgs__msg__StatisticDataType__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            statistics_msgs__msg__StatisticDataType__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return statistics_msgs__msg__StatisticDataType__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            statistics_msgs__msg__StatisticDataType__Sequence__destroy(array);
            array = null;
        }

        static void convert(in StatisticDataType src, ref StatisticDataType.CType dst)
        {
            dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
        }

        static void convert(in StatisticDataType.CType src, ref StatisticDataType dst)
        {
            dst.structure_needs_at_least_one_member = src.structure_needs_at_least_one_member;
        }
    }

    struct MetricsMessage
    {
        string measurement_source_name;
        string metrics_source;
        string unit;
        builtin_interfaces.msg.Time window_start;
        builtin_interfaces.msg.Time window_stop;
        statistics_msgs.msg.StatisticDataPoint[] statistics;

        alias CType = statistics_msgs__msg__MetricsMessage;
        alias CArrayType = statistics_msgs__msg__MetricsMessage__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__statistics_msgs__msg__MetricsMessage();
        }

        static CType* createC() @nogc nothrow
        {
            return statistics_msgs__msg__MetricsMessage__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            statistics_msgs__msg__MetricsMessage__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return statistics_msgs__msg__MetricsMessage__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            statistics_msgs__msg__MetricsMessage__Sequence__destroy(array);
            array = null;
        }

        static void convert(in MetricsMessage src, ref MetricsMessage.CType dst)
        {
            rosidl_runtime_c__String__assign(&dst.measurement_source_name,
                    toStringz(src.measurement_source_name));
            rosidl_runtime_c__String__assign(&dst.metrics_source, toStringz(src.metrics_source));
            rosidl_runtime_c__String__assign(&dst.unit, toStringz(src.unit));
            builtin_interfaces.msg.Time.convert(src.window_start, dst.window_start);
            builtin_interfaces.msg.Time.convert(src.window_stop, dst.window_stop);
            statistics_msgs__msg__StatisticDataPoint__Sequence__init(&dst.statistics,
                    src.statistics.length);
            foreach (i; 0U .. src.statistics.length)
            {
                statistics_msgs.msg.StatisticDataPoint.convert(src.statistics[i],
                        dst.statistics.data[i]);
            }
        }

        static void convert(in MetricsMessage.CType src, ref MetricsMessage dst)
        {
            dst.measurement_source_name = fromStringz(src.measurement_source_name.data).dup();
            dst.metrics_source = fromStringz(src.metrics_source.data).dup();
            dst.unit = fromStringz(src.unit.data).dup();
            builtin_interfaces.msg.Time.convert(src.window_start, dst.window_start);
            builtin_interfaces.msg.Time.convert(src.window_stop, dst.window_stop);
            dst.statistics.length = src.statistics.size;
            foreach (i; 0U .. dst.statistics.length)
            {
                statistics_msgs.msg.StatisticDataPoint.convert(src.statistics.data[i],
                        dst.statistics[i]);
            }
        }
    }

    struct StatisticDataPoint
    {
        ubyte data_type;
        double data;

        alias CType = statistics_msgs__msg__StatisticDataPoint;
        alias CArrayType = statistics_msgs__msg__StatisticDataPoint__Sequence;

        static const(rosidl_message_type_support_t)* getTypesupport() @nogc nothrow
        {
            return rosidl_typesupport_c__get_message_type_support_handle__statistics_msgs__msg__StatisticDataPoint();
        }

        static CType* createC() @nogc nothrow
        {
            return statistics_msgs__msg__StatisticDataPoint__create();
        }

        static void destroyC(ref CType* msg) @nogc nothrow
        {
            statistics_msgs__msg__StatisticDataPoint__destroy(msg);
            msg = null;
        }

        static CArrayType* createC(size_t size) @nogc nothrow
        {
            return statistics_msgs__msg__StatisticDataPoint__Sequence__create(size);
        }

        static void destroyC(ref CArrayType* array) @nogc nothrow
        {
            statistics_msgs__msg__StatisticDataPoint__Sequence__destroy(array);
            array = null;
        }

        static void convert(in StatisticDataPoint src, ref StatisticDataPoint.CType dst)
        {
            dst.data_type = src.data_type;
            dst.data = src.data;
        }

        static void convert(in StatisticDataPoint.CType src, ref StatisticDataPoint dst)
        {
            dst.data_type = src.data_type;
            dst.data = src.data;
        }
    }

}
