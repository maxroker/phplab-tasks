<?php

use PHPUnit\Framework\TestCase;

class SayHelloArgumentWrapperTest extends TestCase
{
    /**
     * @param null|array|object|resource|resource (closed) $input
     * 
     * @dataProvider negativeDataProvider
     */


    public function testNegative($input)
    {
        $this->expectException(InvalidArgumentException::class);
        sayHelloArgumentWrapper($input);
    }

    public function negativeDataProvider()
    {
        $f = fopen('http://www.google.com','r');
        fclose($f);

        return [
            [null],
            [[]],
            [(object) array('1' => 'foo')],
            [fopen('http://www.google.com', 'r')],
            [$f],
        ];
    }  
}