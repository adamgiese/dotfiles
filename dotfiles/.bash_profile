# Typo Fixes

alias vi="vim"
alias im="vim"
alias vmi="vim"
alias ivm="vim"
alias bim="vim"

# Navigations
alias sites="cd ~/sites"

# Image Aliases

nextGenImage() {
  cwebp -q 100 $1.png -o $1.webp
}
alias constrain='sips -Z '
alias width='sips --resampleWidth '

# Misc Functions

slugify() {
  echo $1 | iconv -t ascii//TRANSLIT | sed -E 's/[~\^]+//g' | sed -E 's/[^a-zA-Z0-9]+/-/g' | sed -E 's/^-+\|-+$//g' | sed -E 's/^-+//g' | sed -E 's/-+$//g' | tr A-Z a-z
}

alias timestamp='date "+%Y-%m-%d@%H:%M:%S"'
alias eye="watch -c -n .5 "
alias servethis="python -m SimpleHTTPServer"
alias getpub="pbcopy < ~/.ssh/id_rsa.pub"
alias hosts="sudo vim /etc/hosts"
alias words="wc -w"
alias lines="wc -l"
alias scratch="vim ~/.scratchpad"
alias copyscratch="pbcopy < ~/.scratchpad"
alias r=""

# Dotfiles
alias bp="dotfiles && source ~/.bash_profile"
alias ebp="vim ~/dotfiles/dotfiles/.bash_profile"
alias edit-dotfiles="vim ~/dotfiles"
alias dotfiles="bash ~/dotfiles/setup.sh"
alias dot="cd ~/dotfiles"

# Add defaults to common commands
alias mv='mv -i'
alias cp='cp -i'
alias ls="ls -Gla"

# NPM shortcuts
alias start="npm run start"
alias dev="npm run dev"

# Docker
alias dk="docker "
alias d-c="docker-compose "
alias dup="docker-compose up "
alias drun="docker-compose run "
alias drl="docker-compose run local "
alias dlist="docker ps"
alias dbl="docker-compose up --build local"
alias dlb="docker-compose run local bash"
dbash() { docker exec -it $1 bash }
dstop() { docker stop $(docker ps -a -q); }
dkill() {
  docker stop $(docker ps -aq)
  docker rm $(docker ps -aq)
  docker volume rm $(docker volume ls -q)
}

function dk-clean-containers ()
{
  if [ -n "$(dk ps -q)" ]
  then
    dk stop $(dk ps -q)
  fi

  if [ -n "$(dk ps -aq)" ]
  then
    dk rm $(dk ps -aq)
  fi

  if [ -n "$(dk volume ls -q)" ]
  then
    dk volume rm $(dk volume ls -q)
  fi
}

function dk-clean-all ()
{
  dk-clean-containers

  if [ -n "$(dk images -q)" ]
  then
    dk rmi -f $(dk images -q)
  fi
}

# Helper functions

picker () {
  yarn --silent --cwd ~/node-scripts/picker run start $@
}

# Search

alias vg="git-vim"
vga () {
  vim $(git grep -lz $1)
}

vsm () {
  picker $(git diff --name-only master)
  vim $(choice)
}

findCSS () {
  git grep -IEho "$1:[^;]*;" -- ":(top)*.css" ":(top)*.scss" | sort | uniq | less
}

# mscore

alias mscore="/Applications/MuseScore\ 3.app/Contents/MacOS/mscore"

# random work

rr () {
  open $(node ~/mysites/brain/brain-scripts/get-route/random.mjs)
}
