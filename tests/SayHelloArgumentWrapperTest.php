<?php

use PHPUnit\Framework\TestCase;

class SayHelloArgumentWrapperTest extends TestCase
{
    

    public function testNegativeNull()
    {
        $this->expectException(InvalidArgumentException::class);
        sayHelloArgumentWrapper(null);
    }

    public function testNegativeArray()
    {
        $this->expectException(InvalidArgumentException::class);
        sayHelloArgumentWrapper([]);
    }
    
    public function testNegativeObject()
    {
        $this->expectException(InvalidArgumentException::class);
        sayHelloArgumentWrapper((object) array('1' => 'foo'));
    }

    public function testNegativeResource()
    {
        $this->expectException(InvalidArgumentException::class);
        sayHelloArgumentWrapper(fopen('http://www.google.com', 'r'));
    }

    public function testNegativeResourceClosed()
    {
        $f = fopen('http://www.google.com','r');
        fclose($f); 
        $this->expectException(InvalidArgumentException::class);
        sayHelloArgumentWrapper($f);
    }
    
}