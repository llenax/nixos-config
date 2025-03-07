{
	# Show changes of incremental substitution on split window
  inccommand = "split";

  # Search settings
  smartcase = true;
  ignorecase = true;

  # Preferences
  number = true;
  relativenumber = true;

  splitbelow = true;
  splitright = true;

  signcolumn = "yes";
  shada = [ "'10" "<0" "s10" "h" ];

  swapfile = false;

	# prevent "o" creating new comment
  formatoptions = [ "-o" ];

  wrap = true;
  linebreak = true;
  
  more = false;
  
  foldmethod = "manual";
  
  title = true;
  titlestring = ''%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'';
  
  undofile = true;

  tabstop = 2;
  shiftwidth = 2;
  expandtab = true;
}
