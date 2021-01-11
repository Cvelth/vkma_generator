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
		"INPUT_FILENAME=\"" .. _MAIN_SCRIPT_DIR .. "/vma_xml_generator/output/vma.xml\"",
		"OUTPUT_FILENAME=\"" .. _MAIN_SCRIPT_DIR .. "/output/vkma.hpp\"",
		"COMMAND_PREFIX=\"vma\"",
		"MACRO_PREFIX=\"VMA\"",
		"STRUCT_PREFIX=\"Vma\"",
		"DEFAULT_NAMESPACE=\"vkma\"",
		
		"SPEC_API_NAME=\"vma\"",
		"HEADER_NAME=\"vkma.hpp\"",
		"HEADER_MACRO=\"VKMA\""
	}