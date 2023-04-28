# cath0de
Unleash the historian in you with this amazing bash script! Scrape any YouTube user's page and build a comprehensive index of their videos, complete with date and time posted, absolute URL, title, author's description, and video ID. You'll never lose track of your favorite historical footage again, and with the power of TSV files at your fingertips, you'll be able to organize and analyze your data like a true archivist. Try it out now and become a master historian!
## How it works
This bash script allows you to scrape a YouTube user's page and build an index of their videos in a tab-separated values (TSV) file. The script first prompts the user to enter the username of the YouTube channel they want to scrape, or accepts the username as a command-line argument.

The script then downloads the HTML content of the user's page using `cURL`, a command-line tool for transferring data from and to servers. It extracts the information for each video using regular expressions and writes the information to a `TSV` file.

The TSV file contains the following information for each video: the `time and date` it was posted, the `absolute URL` of the video, the `title` of the video, the author's `description` of the video, and the `video ID`. The first line of the TSV file contains a commented header denoted by "#" symbols, which explains the column names.

By running this script, users can easily create an index of YouTube videos for research, archiving, or personal use. They can also modify the script to extract additional information from the HTML content, or output the data in a different format.

## Limitations

* The script relies on regular expressions to extract information from the HTML content of the user's page. While this approach is simple and works for many cases, it can break if YouTube changes the structure of its HTML content.

* The script only extracts a limited amount of information about each video, including the `time and date` posted, `URL`, `title`, author's `description`, and `video ID`. If you need more information, such as the number of views or comments, you'll need to modify the script.

* The script is only designed to scrape the videos of a single YouTube user. If you want to scrape multiple users' videos, you'll need to modify the script or run it multiple times.

* The script does not handle errors or exceptions very gracefully. For example, if the user's page is unavailable or the HTML content cannot be parsed, the script will likely produce errors. It's important to test the script thoroughly and handle errors appropriately to avoid issues.

* The script only outputs the data in a TSV file. If you need the data in a different format or want to analyze it using a different tool, you'll need to modify the script or use a different tool to convert the TSV file.

## [Disclaimer](DISCLAIMER)
**This software is provided "as is" and without warranty of any kind**, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

**The authors do not endorse or support any harmful or malicious activities** that may be carried out with the software. It is the user's responsibility to ensure that their use of the software complies with all applicable laws and regulations.

## License

These files released under the [MIT License](LICENSE).
