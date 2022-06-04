# VKMA Bindings Generator
The generator used for generating the VKMA bindings. It includes:
- [xml generator](https://github.com/Cvelth/vkma_xml_generator) - a tool for converting [doxygen](https://www.doxygen.nl/index.html) xml documentation into a xml similar to vulkan spec.
- [vulkan-hpp](https://github.com/KhronosGroup/Vulkan-Hpp) [fork](https://github.com/Cvelth/vkma_vulkan_hpp_fork) - a tool for converting vulkan spec-like xml files into `*.hpp`.
  - the fork is configurated using preprocessor macros. Used definitions can be found in `premake5.lua` file in the root of the repository
- [manual vma into vkma bindings](https://github.com/Cvelth/vkma_bindings) - used in order to introduce [VulkanMemoryAllocator](https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator) API changes to streamline/simplify generation.

The latest version of the bindings can be found [here](https://github.com/Cvelth/vkma).

If you find any bugs or problems, I'd appreciate an issue either here or in the [bindings repository](https://github.com/Cvelth/vkma).

# An oversimplified guide as to how someone can update the bindings.
1. Update the manual side of the bindings, it can be found [here](https://github.com/Cvelth/vkma_bindings). There's little general advice I can give about what these should look like, in simple terms, it's a intermediate layer allowing "modification" of the vma interface in a way that would make the generator happy. It is also responsible for changing the name from `vma` to `vkma`.
2. Run doxygen on all three targets, the configs are in the `vkma_xml_generator/doxygen` directory. If successful, it produces the xml-formatted docs in `vkma_xml_generator/xml` subdirrectories.
3. Build and run the `vkma_xml_generator`. `third_party` scripts should make the build as simple as running `premake5 <your-preferred-target-here>` in its directory. Running it combines all of the generated docs into a single `xml` file in the `vkma_xml_generator/output`.
4. Build and run the main generator, it also uses `third_party` scripts, so process should be identical. The produced `generator` executable converts the xml file generated in the previous step into a header and places it in `output/vkma.hpp`. It also invokes the `clang-format` on said header (don't worry if it complains that it cannot find it or something, you can just as well run it manually afterwards).
5. Enjoy your updated bindings, but also consider making a PR, somebody else might find the update useful as well.
