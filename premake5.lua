local templated = require "script/premake/template"
templated.third_party "third_party"

templated.language = "C++"
templated.cppdialect = "C++17"
templated.manifest_path = ".manifest"
templated.vpaths = {
	{ ["precompiled"] = "**/precompiled/**.h*" },
	{ ["precompiled/source"] = "**/precompiled/**.c*" },
	{ ["include/detail"] = "include/detail/**.h*" },
	{ ["source/include/detail"] = "source/detail/**.h*" },
	{ ["source/include"] = "source/**.h*" },
	{ ["source/detail"] = "source/detail/**.c*" },
	{ ["source"] = "source/**.c*" },
	{ ["include"] = "include/**.h*" }
}

templated.workspace "vkma"

templated.project "generator"
    templated.kind "ConsoleApp"
    files "vulkan_hpp_generator_fork/VulkanHppGenerator.*pp"
    targetdir "bin/%{cfg.system}_%{cfg.buildcfg}"
	depends "tinyxml2"

	defines {
		"INPUT_FILENAME=\"" .. _MAIN_SCRIPT_DIR .. "/vkma_xml_generator/output/vkma.xml\"",
		"OUTPUT_FILENAME=\"" .. _MAIN_SCRIPT_DIR .. "/output/vkma.hpp\"",
		"INCLUDED_FILENAME=\"vk_mem_alloc.h\"",
		"INCLUDED_BINDINGS=\"" .. _MAIN_SCRIPT_DIR .. "/vkma_bindings/include/vkma_bindings.hpp\"",
		"CLANG_FORMAT_EXECUTABLE=\"clang-format\"",

		"COMMAND_PREFIX=\"vkma\"",
		"MACRO_PREFIX=\"VKMA\"",
		"STRUCT_PREFIX=\"Vkma\"",
		"CUSTOM_RESULT_ENUM_PREFIX=\"VK\"",
		"DEFAULT_NAMESPACE=\"vkma\"",
		"INSTANCE_HANDLE_NAME=\"Allocator\"",
		
		"SPEC_API_NAME=\"vkma\"",
		"HEADER_NAME=\"vkma.hpp\"",
		"HEADER_MACRO=\"VKMA\"",

		"NO_DISPATCH",
		"NO_ALLOCATION_CALLBACKS",
		"NO_VERSION_CHECK",
		"NO_STRUCTURE_CHAIN",
		"NO_OBJECT_TYPE_ENUM",
		"NO_STRUCTURE_TYPE_ENUM",
		"NO_INDEX_TYPE_TRAITS",
		"NO_DEBUG_REPORT_OBJECT_TYPE_ENUM"
	}