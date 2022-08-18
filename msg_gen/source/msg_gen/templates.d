module msg_gen.templates;

enum string[string] manifestsTemplates = [
        "{{package_name}}/dub.sdl": import("{{package_name}}/dub.sdl.mustache"),
    ];

enum string[string] sourcesTepmlates = [
        "{{package_name}}/source/{{package_name}}/c/{{if_type}}.d": import(
            "{{package_name}}/source/{{package_name}}/c/{{if_type}}.d.mustache"),
        "{{package_name}}/source/{{package_name}}/{{if_type}}.d": import(
            "{{package_name}}/source/{{package_name}}/{{if_type}}.d.mustache"),
    ];

enum string[string] partsTemplates = [
        "c/functions": import("parts/c/functions.mustache"),
        "c/structs": import("parts/c/structs.mustache"),
        "c/typesupports": import("parts/c/typesupports.mustache"),
        "d/actions": import("parts/d/actions.mustache"),
        "d/messages": import("parts/d/messages.mustache"),
        "d/services": import("parts/d/services.mustache"),
    ];

enum string[] ignorePackages = [
        "action_msgs",
        "builtin_interfaces",
        "composition_interfaces",
        "lifecycle_msgs",
        "rcl_interfaces",
        "rosgraph_msgs",
        "statistics_msgs",
        "unique_identifier_msgs"
    ];
