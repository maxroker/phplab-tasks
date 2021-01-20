<?php

use PHPUnit\Framework\TestCase;

class CountArgumentsWrapperTest extends TestCase
{
    public function testNegativeInteger()
    {
        $this->expectException(InvalidArgumentException::class);
        countArgumentsWrapper("1", 2, 3, "4");
    }

    public function testNegativeFloat()
    {
        $this->expectException(InvalidArgumentException::class);
        countArgumentsWrapper("1,5", 2.6, "some");
    }

    public function testNegativeBoolean()
    {
        $this->expectException(InvalidArgumentException::class);
        countArgumentsWrapper("road", false);
    }

    public function testNegativeNull()
    {
        $this->expectException(InvalidArgumentException::class);
        countArgumentsWrapper("dog", NULL);
    }

    public function testNegativeArray()
    {
        $this->expectException(InvalidArgumentException::class);
        countArgumentsWrapper([], "guitar");
    }
    
    public function testNegativeObject()
    {
        $this->expectException(InvalidArgumentException::class);
        countArgumentsWrapper((object) array('1' => 'foo'));
    }

    public function testNegativeResource()
    {
        $this->expectException(InvalidArgumentException::class);
        countArgumentsWrapper(fopen('http://www.google.com', 'r'));
    }

    public function testNegativeResourceClosed()
    {
        $f = fopen('http://www.google.com','r');
        fclose($f); 
        $this->expectException(InvalidArgumentException::class);
        countArgumentsWrapper($f);
    }
    
}