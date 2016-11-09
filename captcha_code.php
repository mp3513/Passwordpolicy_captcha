<?php
 session_start();
  // initialise image with dimensions of 150 x 40 pixels
  $image = @imagecreatetruecolor(150, 40) or die("Cannot Initialize new GD image stream");

  // set background to white and allocate drawing colours
  $font = 'arial.ttf';

  $background = imagecolorallocate($image, 0xFF, 0xFF, 0xFF);
  imagefill($image, 0, 0, $background);
  $linecolor = imagecolorallocate($image, 0xCC, 0xCC, 0xCC);
  $textcolor = imagecolorallocate($image, 0x33, 0x33, 0x33);

  // draw random lines on canvas
  for($i=0; $i < 6; $i++) {
    imagesetthickness($image, rand(1,3));
    imageline($image, 0, rand(0,40), 150, rand(0,40), $linecolor);
  }

  // add random digits to canvas
  /*$digit = '';
  for($x = 15; $x <= 95; $x += 20) {
    $digit .= ($num = rand(0, 9));
    imagechar($image, rand(3, 5), $x, rand(2, 14), $num, $textcolor);
  }*/
  
 //add random letters to canvas 
  $letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  $len = strlen($letters);
  $letter = $letters[rand(0, $len-1)];

for ($i = 0; $i< 5;$i++) {
    $letter = $letters[rand(0, $len-1)];
	imagettftext($image, 15, 0, 5+($i*30), 25, $textcolor, $font, $letter);
    //imagestring($image, $font,  5+($i*30), 10, $letter, $textcolor);
    $word.=$letter;
}


$_SESSION['captcha_code'] = $word;

$text_color = imagecolorallocate($image, 0,0,0);

  // record digits in session variable
  //$_SESSION['digit'] = $digit;

  // display image and clean up
  header('Content-type: image/png');
 imagepng($image);
 imagedestroy($image);


?>