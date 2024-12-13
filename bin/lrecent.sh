#!/bin/bash

# Script to list recent files and open nvim using fzf

 lrecent() {
    # Get the oldfiles list from Neovim
    local oldfiles=($(nvim -u NONE --headless +'lua io.write(table.concat(vim.v.oldfiles, "\n") .. "\n")' +qa))
    
    # Get zoxide query results
    local zoxide_files=($(zoxide query -l))
    
    # Combine both lists and remove duplicates
    local all_files=("${oldfiles[@]}" "${zoxide_files[@]}")
    
    # Filter invalid paths or files not found
    local valid_files=()
    for file in "${all_files[@]}"; do
        if [[ -f "$file" ]]; then
            valid_files+=("$file")
        fi
    done
    
    # Use fzf to select from valid files
    local files=($(printf "%s\n" "${valid_files[@]}" | \
        awk '!seen[$0]++' | \  # Remove duplicates
        grep -v '\[.*' | \
        fzf --multi \
        --preview 'bat -n --color=always --line-range=:500 {} 2>/dev/null || echo "Error previewing file"' \
        --height=70% \
        --layout=default))

    # Open selected files in Neovim
    [[ ${#files[@]} -gt 0 ]] && nvim "${files[@]}"
}

# Call the function
lrecent "$@"
