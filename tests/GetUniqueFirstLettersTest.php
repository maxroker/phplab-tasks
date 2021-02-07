<?php

use PHPUnit\Framework\TestCase;

class GetUniqueFirstLettersTest extends TestCase
{
    /**
     * @param  array  $airports
     * @param  array  $expected
     * 
     * @dataProvider positiveDataProvider
     */
    public function testPositive($airports, $expected)
    {
        $this->assertEquals($expected, getUniqueFirstLetters($airports));
    }

    public function positiveDataProvider()
    {
        return [
            [
                [
                    ["name" => "Nashville Metropolitan Airport"],
                    ["name" => "Atlanta Hartsfield Airport"],
                    ["name" => "Austin Bergstrom Airport"],
                ], ['A', 'N']
            ],
            [
                [
                    ["name" => "Dallas Love Field"],
                    ["name" => "Boise Airport"],
                    ["name" => "Washington Ronald Reagan National Airport"],
                ], ['B', 'D', 'W']
            ],
            [
                [
                    ["name" => "Austin Bergstrom International Airport"],
                    ["name" => "Boston Logan International Airport"],
                    ["name" => "Charlotte Douglas International Airport"],
                    ["name" => "Detroit Metro Airport"],
                    ["name" => "Dallas Ft Worth International"],
                ], ['A', 'B', 'C', 'D']
            ],
            [
                [
                    ["name" => "Denver International"],
                    ["name" => "Detroit Metro Airport"],
                    ["name" => "Dallas Ft Worth International"],
                    ["name" => "Boston Logan International Airport"],
                    ["name" => "Austin Bergstrom International Airport"],
                ], ['A', 'B', 'D']
            ],
        ];
    }


    /**
     * @param  string|int|double|bool  $invalid
     * 
     * @dataProvider negativeDataProvider
     */
    public function testNegative($invalid)
    {
        $this->expectException(TypeError::class);

        getUniqueFirstLetters($invalid);
    }
   
    public function negativeDataProvider()
    {
        return [
            ["word"],
            [6],
            [2.6],
            [false],
        ];
    }     
}