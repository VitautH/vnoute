<?php if ($modules) { ?>
    <aside id="column-left" class="col-sm-3 ">
        <?php foreach ($modules as $module) { ?>
            <?php echo $module; ?>
        <?php } ?>
        <a href="/index.php?route=account/register" class="btn-opt"><span></span>Получить доступ к оптовым ценам</a>
    </aside>
<?php } ?>