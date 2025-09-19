from selenium.webdriver.chrome.options import Options

def chrome_options():
    """Return ChromeOptions with Docker-safe flags."""
    options = Options()
    options.add_argument("--headless=new")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--disable-gpu")
    return options
