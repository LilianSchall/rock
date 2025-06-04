{pkgs ? import <nixpkgs>{}}:
pkgs.mkShell rec {
	name = "Test Env";
	nativeBuildInputs = [];

	buildInputs = with pkgs;[
		libxkbcommon
		libGL

		sdl3
		sdl3-ttf

		cmake
		catch2
		glm
		gcc

		pkg-config

		xorg.libX11
		xorg.libXrandr
		xorg.libXcursor
		xorg.libXi
		xorg.libXxf86vm

		glfw3
		mesa
		glslang
		renderdoc
		spirv-tools
		vulkan-volk
		vulkan-tools
		vulkan-loader
		vulkan-headers
		vulkan-validation-layers
		vulkan-tools-lunarg
		vulkan-extension-layer
	];

	packages = [];

	shellHook = with pkgs; ''
	echo "Welcome to my Vulkan Shell"
	echo "vulkan loader: ${vulkan-loader}"
	echo "vulkan headers: $vulkan-headers}"
	echo "validation layer: ${vulkan-validation-layers}"
	echo "tools: ${vulkan-tools}"
	echo "tools-lunarg: ${vulkan-tools-lunarg}"
	echo "extension-layer: ${vulkan-extension-layer}"
	'';

	LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath buildInputs}";
	VK_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
	VULKAN_SDK = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
	XDG_DATA_DIRS = builtins.getEnv "XDG_DATA_DIRS";
	XDG_RUNTIME_DIR = "/run/user/1000";
}
