function installFish {
  sudo apt-add-repository ppa:fish-shell/release-3 -y
  sudo apt update -y
  sudo apt install fish -y
  chsh -s $(which fish)

  fish
}

function installStarship {
  curl -sS https://starship.rs/install.sh | sh
  echo "starship init fish | source" >> ~/.config/fish/config.fish

  source ~/.config/fish/config.fish
}

function installASDF {
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
  echo "source ~/.asdf/asdf.fish" >> ~/.config/fish/config.fish
  mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

  source ~/.config/fish/config.fish
}

function installGitFlow {
  sudo apt install git-flow -y
}

function getDotFiles {
  git clone "https://github.com/dreisss/.files.git" "~/.files"
}

function createLinks {
  ln ~/.files/.gitconfig ~/.gitconfig
}

function updatePackages {
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install build-essential -y
  sudo apt autoremove -y
}

# === === ==== ==== running
installFish
installStarship
installASDF
installGitFlow

getDotFiles
createLinks

updatePackages
