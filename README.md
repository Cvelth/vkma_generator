# VKMA Bindings Generator
The generator used for generating the VKMA bindings. It includes:
- [xml generator](https://github.com/Cvelth/vkma_xml_generator) - a tool for converting [doxygen](https://www.doxygen.nl/index.html) xml documentation into a xml similar to vulkan spec.
- [vulkan-hpp](https://github.com/KhronosGroup/Vulkan-Hpp) [fork](https://github.com/Cvelth/vkma_vulkan_hpp_fork) - a tool for converting vulkan spec-like xml files into `*.hpp`.
  - the fork is configurated using preprocessor macros. Used definitions can be found in `premake5.lua` file in the root of the repository
- [manual vma into vkma bindings](https://github.com/Cvelth/vkma_bindings) - used in order to introduce [VulkanMemoryAllocator](https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator) API changes to streamline/simplify generation.

The latest version of the bindings can be found [here](https://github.com/Cvelth/vkma).

If you find any bugs or problems, I'd appreciate an issue either here or in the [bindings repository](https://github.com/Cvelth/vkma).
