<?php

use PHPUnit\Framework\TestCase;

class SayHelloTest extends TestCase
{
    /**
     * @param string $expected
     * 
     * @dataProvider positiveDataProvider
     */
    public function testPositive($expected)
    {
        $this->assertEquals($expected, SayHello());
    }

    public function positiveDataProvider()
    {
        return [
            ['Hello']
        ];
    }
}