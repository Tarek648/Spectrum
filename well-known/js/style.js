const savedTheme = localStorage.getItem("theme");

if (savedTheme === "light") {
    document.body.classList.add("light-theme");
}

// Handle toggle click
document.getElementById("theme-toggle").addEventListener("click", () => {
    document.body.classList.toggle("light-theme");

    // Save preference
    if (document.body.classList.contains("light-theme")) {
        localStorage.setItem("theme", "light");
    } else {
        localStorage.setItem("theme", "dark");
    }
});

