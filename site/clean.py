from bs4 import BeautifulSoup
import os


def clean_html_file(file_path):
    with open(file_path, "r", encoding="utf8") as file:
        soup = BeautifulSoup(file, "html.parser")

    for a_tag in soup.find_all("a"):
        # Find all <img> tags within each <a> tag
        images = a_tag.find_all("img")
        # Insert images back into the soup before the <a> tag
        for img in images:
            a_tag.insert_before(img)
            # Replace "IMAGES" with "Pictures" in the src attribute
            if img.has_attr("src"):
                img["src"] = img["src"].replace("IMAGES/", "Pictures/")
        # Remove the <a> tag after reinserting the images
        a_tag.decompose()

    # Remove all elements with class "chapter-buttons"
    for chapter_button in soup.find_all(class_="chapter-buttons"):
        chapter_button.decompose()

    # Remove all elements with class "title-image"
    for title_image in soup.find_all(class_="title-image"):
        title_image.decompose()

    for title_image in soup.find_all(class_="modal"):
        title_image.decompose()
    with open(file_path, "w", encoding="utf8") as file:
        file.write(str(soup))


# Define the range for your chapters
chapters_range = range(11)  # This includes 1 through 10

# Define the directory where the files are located
directory = "./"  # Current directory; adjust as needed

# Iterate over the files and process each
for chapter in chapters_range:
    file_name = f"CH{chapter}.htm"
    file_path = os.path.join(directory, file_name)
    clean_html_file(file_path)
    print(f"Cleaned {file_path}")
