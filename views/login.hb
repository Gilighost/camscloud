<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Cam's Cloud - Log In</title>
    <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <script src='/js/jquery.js'></script>
    <script src="/js/login.js"></script>
    <link rel="icon" type="image/png" href="/img/cloud.png">
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/login.css">
  </head>
  <body>
    <div>

      {{#if error}}
      <div class="login">
        <header class="headererror">
          <span class="text">{{error}}</span>
          <span class="loader"></span>
        </header>
        <form class="form" method="post">
          <input class="input" type="text" placeholder="Username" name="username"/>
          <input class="input" type="password" placeholder="Password" name="password"/>
          <button class="btn" type="submit"/>
        </form>
      </div>
      {{else}}
      <div class="login">
        <header class="header">
          <span class="text">Cam's Cloud</span>
          <span class="loader"></span>
        </header>
        <form class="form" method="post">
          <input class="input" type="text" placeholder="Username" name="username"/>
          <input class="input" type="password" placeholder="Password" name="password"/>
          <button class="btn" type="submit"/>
        </form>
      </div>
      {{/if}}
    </div>
  </body>
</html>
