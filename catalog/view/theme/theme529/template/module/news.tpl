<div class="news-container">
    <?php if ($show_title) { ?>
        <h2 class="main-title"><?php echo $show_icon ? '<i class="fa fa-newspaper-o fa-3x"></i>&nbsp;' : ''; ?><?php echo $heading_title; ?></h2>
    <?php } ?>
    <?php if (!empty($news)) { ?>
        <ul>
            <?php foreach ($news as $news_item) { ?>
                <li>
                    <h4><a href="<?php echo $news_item['href']; ?>"><?php echo $news_item['title']; ?></a></h4>
                    <p><?php echo $news_item['description']; ?></p>
                </li>
            <?php } ?>
        </ul>
    <?php } ?>
</div>