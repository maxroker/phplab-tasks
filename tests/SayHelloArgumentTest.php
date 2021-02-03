<?php

use PHPUnit\Framework\TestCase;

class SayHelloArgumentTest extends TestCase
{
    /**
     * @param int|string|bool $input
     * @param string $expected
     * 
     * @dataProvider positiveDataProvider
     */
    public function testPositive($input, $expected)
    {
        $this->assertEquals($expected, sayHelloArgument($input));
    }

    public function positiveDataProvider()
    {
        return [
            ['Max', "Hello Max"],
            ['Bob', "Hello Bob"],
            ['ann', "Hello ann"],
            [1, "Hello 1"],
            [3, "Hello 3"],
            [true, "Hello 1"],
            [false, "Hello "],
        ];
    }
}