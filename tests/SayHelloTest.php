<?php

use PHPUnit\Framework\TestCase;

class SayHelloTest extends TestCase
{
    /**
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