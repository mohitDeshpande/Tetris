//
//  Array2D.swift
//  Tetris
//
//  Created by Mohit Deshpande on 28/11/14.
//  Copyright (c) 2014 Mohit Deshpande. All rights reserved.
//
//  This is the layout of the game board. The game board consists of 20 rows and 10 columns.
//  We will be implementing these using a 2D array. T is a placeholder(enables any typeof data to be stored)
//  nil locations in the game board represent empty spots where no block is present

class Array2D<T> {
    let columns: Int
    let rows: Int
    
    var array: Array<T?>    // ? symbolizes optional value
    
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        
        // Instantiate the internal array structure with given number of elements
        array = Array<T?>(count: rows * columns, repeatedValue: nil)
    }
    
    // get the value or set the value of the class instance
    // for further reading check out Subscripts in the Swift Programming Guide.
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[(row * columns) + column]  
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}

