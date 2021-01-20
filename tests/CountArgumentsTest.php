<?php

use PHPUnit\Framework\TestCase;

class CountArgumentsTest extends TestCase
{
    /**
     * @dataProvider positiveDataProvider
     */
    public function testPositive($expected, ...$args)
    {
        $this->assertEquals($expected, countArguments(...$args));
    }

    public function positiveDataProvider()
    {
        return [
            [
                [
                'argument_count'  => NULL, 
                'argument_values' => []
                ], 
            ],
            [
                [
                'argument_count'  => 2, 
                'argument_values' => [0 => "tree", 1 => "dog"]
                ], 
                "tree", "dog"
            ],
            [
                [
                'argument_count'  => 1, 
                'argument_values' => [0 => "first"]
                ], 
                "first"
            ],
            [
                [
                'argument_count'  => 3, 
                'argument_values' => [0 => "first", 1 => "apple", 2 => "banana"]
                ], 
                "first", "apple", "banana"
            ],
        ];
    }
}