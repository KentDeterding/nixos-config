
To get git credentials working, I needed to use:

    gh auth login

followed by
    
    git config --global 'credential.https://github.com.helper'
    git config --global --add 'credential.https://github.com.helper' '!gh auth git-credentials'

