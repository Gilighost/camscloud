Cameron LaFerney
Project #2 - MyCloud (Cam's Cloud)

Additional resources used:
  -Bootstrap for styles
  -http://codepen.io/team/nclud/pen/GJpdVo for 404 page
  -Node module Mimetypes to get the mime types of files for the header


Testing:
  Go to the URL http://localhost:8000 or http://localhost:8000/files/

  It will redirect you to the login page.

  Log in to application as either of the following:
      Username: Cam, Password: password
      Username: TambourineMan, Password: blowininthewind

  Logging in will direct you to the files page which lists the contents of the root storage directory.
  Visit the same URL in a second window and click "Log out" in the dropdown menu from the user name in the top right.
  Log in as
      Username: BTK, Password: fastdraw

  You should see the files, but have no way of uploading a file or creating a directory.

  Return to the first window and click "Upload file".
  It should redirect you to the Files page, with no way of uploading a file or creating a directory.

Design:
  Each request has a controller for it, which handles what should happen from there.
  Redirects are used to make sure correct content is being shown.

Partial:
  I have several Navigation partials, one for each page, and one that the other Nav partials use
  These are helpful because i can plug them in to any other template to give it a navigaton bar

If I had more time:
  Id get the upload/new directory done through modals rather than separate pages.

Strengths:
  -Design, I used Bootstrap for all of my templates for a professional look.
  -I provided a way of deleting a file or directory for users with write permissions
  -I provided a way of renaming a file or directory for users with write permissions
    -The way I implemented this allows users to easily change which directory the file is in.
    -The rename modal automatically highlights the name of the file user is renaming.
  -I have a directory navigation list which shows the current path, and allows the user to click back
    to any parent directory.
  -If the user tries to upload a file with the same name as another file, it will get renamed
    to a number with the file name
