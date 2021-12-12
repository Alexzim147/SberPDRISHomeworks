package com.houarizegai.calculator;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class CalculatorTest {
    /*
     * testCalc() test method
     */
    @Test
    public void testCalc() {
        Calculator calculator = new Calculator();
        double first = 3;
        String second = "5";

        try {
            assertEquals(8, calculator.calc(first, second, '+'));
            assertEquals(-2, calculator.calc(first, second, '-'));
            assertEquals(15, calculator.calc(first, second, '*'));
            assertEquals(0.6, calculator.calc(first, second, '/'));
            assertEquals(3d, calculator.calc(first, second, '%'));
            assertEquals(243, calculator.calc(first, second, '^'));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
