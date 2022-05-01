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
 *  Name:    Alphabetizer.java
 * 
 *  Purpose: Sorts circular shifts alphabetically
 * 
 *  Created: 23 Sep 2002 
 * 
 *  $Id$
 * 
 *  Description:
 *    Sorts circular shifts alphabetically
 * </file>
*/



/*
 * $Log$
*/

/**
 *  An object of the Alphabetizer class sorts all lines, that it gets
 *  from CircularShifter. Methods to access sorted lines are provided.
 *  @author  dhelic
 *  @version $Id$
*/

public class Alphabetizer{

//----------------------------------------------------------------------
/**
 * Fields
 *
 */
//----------------------------------------------------------------------

/**
 * Array holding sorted indices of lines
 *
 */

  private int sorted_[];

/**
 * CircularShifter that provides lines
 *
 */

  private CircularShifter shifter_;

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
 * Sorts all lines from the shifter.
 * @param shifter the source of lines
 */

  public void alpha(CircularShifter shifter){
    shifter_ = shifter;
    sorted_ = new int[shifter.getLineCount()];
    for(int i = 0; i < sorted_.length; i ++)sorted_[i] = i;
    sort(0, sorted_.length-1);
  }

//----------------------------------------------------------------------
/**
 * This method builds and reconstucts the heap for the heap sort algorithm.
 * @param root heap root
 * @param bottom heap bottom
 */

  private void siftDown(int root, int bottom){    

  }

//----------------------------------------------------------------------
/**
 * Gets the line from the specified position.
 * String array representing the line is returned.
 * @param line line index
 * @return String[]
 * @see #getLineAsString
 */

  public String[] getLine(int line){
    return shifter_.getLine(sorted_[line]);
  }

//----------------------------------------------------------------------
/**
 * Gets the line from the specified position.
 * String representing the line is returned.
 * @param line line index
 * @return String[]
 * @see #getLine
 */

  public String getLineAsString(int line){
    return shifter_.getLineAsString(sorted_[line]);
  }

//----------------------------------------------------------------------
/**
 * Gets the number of lines.
 * @return int
 */

  public int getLineCount(){
    return shifter_.getLineCount();
  }

  private void swap(int i, int j){
    int temp = sorted_[i];
    sorted_[i] = sorted_[j];
    sorted_[j] = temp;
  }

  private void sort(int left, int right){
    if(left >= right)return;
    int i = left -1, j = right + 1, pivot = sorted_[(left+right)>>1];
    while(i < j){
      do i ++;while (shifter_.getLineAsString(sorted_[i]).compareTo(shifter_.getLineAsString(pivot) )< 0);
      do j--;while(shifter_.getLineAsString(sorted_[j]).compareTo(shifter_.getLineAsString(pivot)) > 0);
      if(i < j){
        swap(i, j);
      }
    }
    sort(left, j);
    sort(j+1, right);
  }
//----------------------------------------------------------------------
/**
 * Inner classes
 *
 */
//----------------------------------------------------------------------

}
