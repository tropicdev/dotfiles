function gitclean {
  # Find all directories that are not ignored by git and store them in an array
  ignored_dirs=($(git ls-files --others --exclude-standard --directory))
  # Loop through all directories that are not ignored by git
  for dir in "${ignored_dirs[@]}"; do
    # Check if the directory contains any non-gitignored files/folders
    if [[ -z $(git ls-files --directory "$dir") ]]; then
      # If the directory contains only gitignored files/folders, remove it
      echo "removing $dir"
      rm -rf "$dir"
    fi
  done
}
