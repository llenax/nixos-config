{
  programs.nixvim = {
  	enable = true;
	defaultEditor = true;

	nixpkgs.useGlobalPackages = true;

	viAlias = true;
	vimAlias = true;
  };
}
