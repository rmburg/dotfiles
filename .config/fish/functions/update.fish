function update --description 'Update packages from the repos, the AUR and Flatpak'
    paru -Syu --devel && flatpak update
end

