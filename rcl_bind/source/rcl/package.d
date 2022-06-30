module rcl;

version (rolling) public import rcl.rolling;

version (humble) public import rcl.humble;

version (galactic) public import rcl.galactic;

version (foxy) public import rcl.foxy;

alias rcl_error_is_set = rcutils_error_is_set;
alias rcl_get_error_string = rcutils_get_error_string;
