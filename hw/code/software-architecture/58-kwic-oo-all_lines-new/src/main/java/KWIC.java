// -*- Java -*-
/*
 * <copyright>
 * 
 *  Copyright (c) 2002
 *  Institute for Information Processing and Computer Supported New Media (IICM),
 *  Graz University of Technology, Austria.
 * 
 * </copyright>
 * 
 * <file>
 * 
 *  Name:    KWIC.java
 * 
 *  Purpose: The Master Control class
 * 
 *  Created: 20 Sep 2002 
 * 
 *  $Id$
 * 
 *  Description:
 *    The Master Control class
 * </file>
*/

/*
 * $Log$
*/

import javax.sound.sampled.Line;

/**
 *  An instance of the KWIC class controls all other objects in the KWIC system
 *  to achieve the desired functionality. Thus, KWIC instance creates the following 
 *  instances of other classes:
 *  <ul>
 *  <li>An instance of the LineStorage class that holds the parsed data
 *  <li>An instance of the Input class which parses the input file
 *  <li>An instance of the CircularShift class that makes all circular
 *  shifts of lines
 *  <li>An instance of the Alphabetizer class that sorts circular
 *  shifts alphabetically
 *  <li>An instance of the Output class that prints the lines in a nice format
 *  </ul>
 *  The KWIC class provides also the main method which checks the command line
 *  arguments.
 *  @author  dhelic
 *  @version $Id$
*/

public class KWIC{

//----------------------------------------------------------------------
/**
 * Fields
 *
 */
//----------------------------------------------------------------------

//----------------------------------------------------------------------
/**
 * Constructors
 *
 */
//----------------------------------------------------------------------

//----------------------------------------------------------------------
/**
 * Methods
 *
 */
//----------------------------------------------------------------------

//----------------------------------------------------------------------
/**
 * Parses the data, makes shifts and sorts them. At the end prints the
 * sorted shifts.
 * @param file name of the input file
 */

  public void execute(String file){
    Input inputHelper = new Input();
    LineStorage lineStorage = new LineStorage();
    inputHelper.parse(file, lineStorage);
    CircularShifter circularShifter = new CircularShifter();
    circularShifter.setup(lineStorage);
    Alphabetizer alphabetizer = new Alphabetizer();
    alphabetizer.alpha(circularShifter);
    Output outputHelper = new Output();
    outputHelper.print(alphabetizer);
  }

//----------------------------------------------------------------------
/**
 * Main function checks the command line arguments. The program expects 
 * exactly one command line argument specifying the name of the file 
 * that contains the data. If the program has not been started with 
 * proper command line arguments, main function exits
 * with an error message. Otherwise, a KWIC instance is created and program
 * control is passed to it.
 * @param args command line arguments
 */

  public static void main(String[] args){

    KWIC kwic = new KWIC();
    kwic.execute("Test_Case.txt");
  }

//----------------------------------------------------------------------
/**
 * Inner classes
 *
 */
//----------------------------------------------------------------------

}
