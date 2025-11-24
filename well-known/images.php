<?php
$directories = [
    './assets/home/',
    './assets/service_page_uploads/',
    './assets/structure/',
    './assets/projects_uploads/',
    './images/'
];

foreach ($directories as $dir) {
    $images = glob($dir . '*.{jpg,jpeg,png,JPG,JPEG,PNG}', GLOB_BRACE);
    
    foreach ($images as $image) {
        $info = getimagesize($image);
        
        if ($info[2] == IMAGETYPE_JPEG) {
            $img = imagecreatefromjpeg($image);
            imagejpeg($img, $image, 75); // 75% quality
            imagedestroy($img);
        } elseif ($info[2] == IMAGETYPE_PNG) {
            $img = imagecreatefrompng($image);
            imagepng($img, $image, 7); // Compression level 7
            imagedestroy($img);
        }
        
        echo "Compressed: $image<br>";
    }
}

echo "Done! All images compressed.";
?>