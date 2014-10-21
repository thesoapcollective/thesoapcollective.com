<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8'>
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta content="We're a company of storytellers." name='description'>

    <meta content='The Soap Collective' property='og:title'>
    <meta content='The Soap Collective' property='og:site_name'>
    <meta content='http://www.thesoapcollective.com' property='og:url'>
    <meta content="We're a company of storytellers. Following the tradition that began with spoken word and evolved into books, film, and games, Soap is building new ways for people to share narrative experiences. We believe in leveraging the latest technology to imagine better worlds and connect people in meaningful ways." property='og:description'>
    <meta content='http://www.thesoapcollective.com/images/soap_open_graph.jpg' property='og:image'>
    <meta property="fb:admins" content="1325850192" />
    <meta property="fb:admins" content="682837756" />

    <link href='http://www.thesoapcollective.com/favicon.png' rel='shortcut icon'>
    <link href='http://www.thesoapcollective.com/favicon.png' rel='apple-touch-icon'>

    <title> The Soap Collective</title>

    <link href='stylesheets/main.css' rel='stylesheet' type='text/css' />
  </head>

  <body class='index'>
    <div id='page-container'>
      <header id='page-header'>
        <h1>The Soap Collective</h1>
      </header>

      <article id='page-content'>
        <section>
          <p class='centered-paragraph'>We're a company of storytellers. Following the tradition that began with spoken word and evolved into books, film, and games, Soap is building new ways for people to share narrative experiences. We believe in leveraging the latest technology to imagine better worlds and connect people in meaningful ways.</p>
        </section>

        <section>
          <h2>Our Projects</h2>
          <a id='role' class='project-wrapper' href='http://www.roleapp.com' target='_blank' title='Go to the Role website.'>
            <div id='role-logo'>Role</div>
            <p class='centered-paragraph'>A group storytelling adventure game for iOS and tabletop. Designed around the idea that role playing games should be simple and fun, Role is a fast-paced cooperative game that rewards creativity and social interaction. Gather your friends, become fantastic characters, and go on wild adventures. The only limit is your imagination.</p>
          </a>
        </section>

        <section>
          <h2>Who are we?</h2>
          <div id='bios'>
            <a class='bio-container' href='https://twitter.com/ianhirschfeld' target='_blank' title="Go to Ian's Twitter page">
              <div class='bio-image'></div>
              <div class='bio-content'>
                <h3>Ian Hirschfeld</h3>
                <p>A builder and obsessive filmmaker who considers himself both engineer and artist. Invested in both telling the story and knowing how to best bring it to life.</p>
              </div>
            </a>
            <a class='bio-container' href='https://twitter.com/logandwight' target='_blank' title="Go to Logan's Twitter page">
              <div class='bio-image'></div>
              <div class='bio-content'>
                <h3>Logan Dwight</h3>
                <p>Experience designer, writer, and visual artist. Searching for the next narrative leap, beyond the interaction of video games and the synesthesia of film.</p>
              </div>
            </a>
          </div>
        </section>

        <?php /*
        <section>
          <h2>From Our Blog</h2>
          <header class='post-header'>
            <a class='post-title' href='#' target='_blank'><h3></h3></a>
            <a class='post-date' href='#' target='_blank'></a>
          </header>
          <article class='post-body'></article>
          <footer class='post-footer'>
            <ul class='post-tags plain-list'>
              <li><strong>Tags:</strong></li>
            </ul>
            <ul class='post-social plain-list'>
              <!-- <li>
                <a class='post-social-share' href='#' target='_blank'>Share</a>
              </li> -->
              <li>
                <a class='post-social-reblog' href='#' target='_blank'>Reblog</a>
              </li>
              <!-- <li>
                <a class='post-social-like' href='#' target='_blank'>Like</a>
              </li> -->
            </ul>
          </footer>
        </section>

        <section class="blog-section">
          <h2>Read More On</h2>
          <a id="blog-button" href='http://blog.thesoapcollective.com'>Our Blog</a>
        </section>
        */
        ?>
      </article>

      <footer id='page-footer'>
        <ul class='social-list plain-list'>
          <li>
            <a class='icon-twitter-circled social-icon' href='https://twitter.com/soapcollective' target='_blank'></a>
          </li>
          <li>
            <a class='icon-facebook-circled social-icon' href='https://facebook.com/thesoapcollective' target='_blank'></a>
          </li>
        </ul>
      </footer>
    </div>

    <script src='//use.typekit.net/dhn8nfe.js' type='text/javascript'></script>
    <script>
      // Typekit
      try{Typekit.load();}catch(e){}
    </script>
    <script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js'></script>
    <script src='js/moment.js'></script>
    <script src='//blog.thesoapcollective.com/api/read/json?type=text&start=0&num=1'></script>
    <script>
      // Setup blog
      $(document).ready(function(){
        var post = tumblr_api_read.posts[0];
        $('.post-title')
          .attr('href', post['url-with-slug'])
          .find('h3').text(post['regular-title']);
        $('.post-date')
          .attr('href', post['url-with-slug'])
          .text(moment.unix(post['unix-timestamp']).format('MMMM D, YYYY'));
        $('.post-body').html(post['regular-body']);
        $.each(post['tags'], function(_, tag) {
          var $li = $('<li/>')
          var $a = $('<a/>').attr('href', 'http://blog.thesoapcollective.com/tagged/' + tag).text('#' + tag)
          $('.post-tags').append($li.append($a));
        });
        $('.post-social-reblog').attr('href', 'https://www.tumblr.com/reblog/' + post['id'] + '/' + post['reblog-key'])
        $('.post-social-like').attr('href', post['url-with-slug'] + '?like=1')
      });

      // Google Analytics
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      ga('create', 'UA-11359166-1', 'auto');
      ga('send', 'pageview');
    </script>
  </body>
</html>
