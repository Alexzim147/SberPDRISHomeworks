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
        double second = 5;

        try {
            assertEquals(8, calculator.add(first, second), 0.1);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
