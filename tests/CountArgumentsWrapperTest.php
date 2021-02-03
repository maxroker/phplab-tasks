<?php

use PHPUnit\Framework\TestCase;

class CountArgumentsWrapperTest extends TestCase
{
    /**
     * @dataProvider negativeDataProvider
     */

    public function testNegative(...$input)
    {
        $this->expectException(InvalidArgumentException::class);
        countArgumentsWrapper(...$input);
    }

    public function negativeDataProvider()
    {
        $f = fopen('http://www.google.com','r');
        fclose($f);

        return [
            [],
            ["1", 2, 3, "4"],
            ["1,5", 2.6, "some"],
            ["road", false],
            ["dog", NULL],
            [[], "guitar"],
            [(object) array('1' => 'foo')],
            [fopen('http://www.google.com', 'r')],
            [$f],
        ];
    }     
}