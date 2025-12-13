ssh-keygen -R '[localhost]:2222'
scp ~/.ssh/github_ed25519.pub dev-linux:~/.ssh/authorized_keys
scp ~/.ssh/github_ed25519.pub dev-linux:~/.ssh/github_ed25519.pub
scp ~/.ssh/github_ed25519 dev-linux:~/.ssh/github_ed25519
ssh dev-linux 'cd ~/.dotfiles && git remote set-url origin git@github.com:HayatoDoi/dotfiles.git'
