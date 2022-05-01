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
 *  Purpose: Demo system for practice in Software Architecture
 *
 *  Created: 11 Sep 2002
 *
 *  $Id$
 *
 *  Description:
 *    The basic KWIC system is defined as follows. The KWIC system accepts an ordered
 *  set of lines, each line is an ordered set of words, and each word is an ordered set
 *  of characters. Any line may be "circularly shifted" by repeadetly removing the first
 *  word and appending it at the end of the line. The KWIC index system outputs a
 *  listing of all circular shifts of all lines in alphabetical order.
 * </file>
 */

//package kwic.ms;

/*
 * $Log$
 */


import java.io.FileReader;
import java.io.BufferedReader;
import java.io.CharArrayWriter;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.*;

/**
 * This class is an implementation of the main/subroutine architectural solution
 * for the KWIC system. This solution is based on functional
 * decomposition of the system. Thus, the system is decomposed into a number of
 * modules, each module being a function. In this solution all functions share access
 * to data, which is stored in the "core storage". The system is decomposed into the
 * following modules (functions):
 * <ul>
 * <li>Master Control (main). This function controls the sequencing among the
 * other four functions.
 * <li>Input. This function reads the data lines from the input medium (file) and
 * stores them in the core for processing by the remaining modules. The characters are
 * stored in a character array (char[]). The blank space is used to separate words in
 * a particular line. Another integer array (int[]) keeps the starting indices of
 * each line in the character array.
 * <li>Circular Shift. This function is called after the input function has
 * completed its work. It prepares a two-dimensional integer array (int[][]) to keep
 * track of all circular shifts. The array is organized as follows: for each circular
 * shift, both index of its original line, together with the index of the starting word of
 * that circular shift are stored as one column of the array.
 * <li>Alphabetizing. This function takes as input the arrays produced by the input
 * and circular shift functions. It produces an array in the same format (int[][])
 * as that produced by circular shift function. In this case, however, the circular
 * shifts are listed in another order (they are sorted alphabetically).
 * <li>Output. This function uses the arrays produced by input and alphabetizing
 * function. It produces a nicely formated output listing of all circular shifts.
 * </ul>
 * @author dhelic
 * @version $Id$
 */

public class KWIC {

//----------------------------------------------------------------------
/**
 * Fields
 *
 */
//----------------------------------------------------------------------


    /*
     * Core storage for shared data
     *
     */

    /**
     * Input characters
     */

    private char[] chars_;

    /**
     * Array that keeps line indices (line index is the index of the first character of a line)
     */

    private int[] line_index_;

    /**
     * Array that counts word number in a given line
     */
    private int[] line_word_count_;

    /**
     * 2D array that keeps circular shift indices (each circular shift index is a column
     * in this 2D array, the first index is the index of the original line from line_index_
     * array, the second index is the index of the starting word from chars_ array of
     * that circular shift)
     */

    private int[][] circular_shifts_;

    /**
     * 2D array that keeps circular shift indices, sorted alphabetically
     */

    private int[][] alphabetized_;

//----------------------------------------------------------------------
/**
 * Constructors
 *
 */
//----------------------------------------------------------------------

//----------------------------------------------------------------------

    /**
     * Methods
     */
//----------------------------------------------------------------------
    // Methods for unit test
    public int getLineIndex(int lineNo) {
        return line_index_[lineNo];
    }

    public int getLineWordCount(int lineNo){
        return line_word_count_[lineNo];
    }

    public void printCircularShift(){
        for(int i = 0 ; i < circular_shifts_.length; i ++){
            System.out.println(circular_shifts_[i][0] + " " + circular_shifts_[i][1]);
        }
    }

    public void printAlphabetized() {
        for(int i = 0; i < alphabetized_.length; i ++){
            System.out.println(alphabetized_[i][0] + " " + alphabetized_[i][1]);
        }
    }
//----------------------------------------------------------------------

    /**
     * Input function reads the raw data from the specified file and stores it in the core storage.
     * If some system I/O error occurs the program exits with an error message.
     * The format of raw data is as follows. Lines are separated by the line separator
     * character(s) (on Unix '\n', on Windows '\r\n'). Each line consists of a number of
     * words. Words are delimited by any number and combination of the space chracter (' ')
     * and the horizontal tabulation chracter ('\t'). The entered data is parsed in the
     * following way. All line separators are removed from the data, all horizontal tabulation
     * word delimiters are replaced by a single space character, and all multiple word
     * delimiters are replaced by a single space character. Then the parsed data is represented
     * in the core as two arrays: chars_ array and line_index_ array.
     *
     * @param file Name of input file
     */

    public void input(String file) {
        List<Character> chars_list = new ArrayList<>();
        List<Integer> lines_index_list = new ArrayList<>();
        List<Integer> words_count_list = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line = "";
            int chars_pointer = 0;
            while ((line = br.readLine()) != null) {
                line = line.replaceAll("\t", " ");
                String[] words = line.split(" ");
                lines_index_list.add(chars_pointer);
                int word_count = 0;
                for (int j = 0; j < words.length; j++) {
                    String word = words[j];
                    if("".equals(word))continue;
                    word_count ++;
                    for (int i = 0; i < word.length(); i++) {
                        chars_list.add(word.charAt(i));
                        chars_pointer ++;
                    }
                    if (j != words.length - 1){
                        chars_list.add(' ');
                        chars_pointer ++;
                    }
                }
                words_count_list.add(word_count);
            }
            chars_ = new char[chars_list.size()];
            for(int i = 0; i < chars_list.size(); i ++)chars_[i] = chars_list.get(i);
            line_index_ = new int[lines_index_list.size()];
            for(int i = 0; i < lines_index_list.size(); i ++)line_index_[i] = lines_index_list.get(i);
            line_word_count_ = new int[words_count_list.size()];
            for(int i = 0; i < words_count_list.size(); i ++)line_word_count_[i] = words_count_list.get(i);
        } catch (IOException e) {
            System.out.println("Error occurs when reading files!");
            System.exit(-1);
        }
    }

//----------------------------------------------------------------------

    /**
     * This function processes arrays prepared by the input
     * function and produces circular shifts of the stored lines. A circular
     * shift is a line where the first word is removed from the begin of a line
     * and appended at the end of the line. To obtain all circular shifts of a line
     * we repeat this process until we can't obtain any new lines. Circular shifts
     * are represented as a 2D array that keeps circular shift indices (each circular
     * shift index is a column in this 2D array, the first index is the index of
     * the original line from line_index_ array, the second index is the index of
     * the starting word from chars_ array of that circular shift)
     */

    public void circularShift() {
        List<Integer[]> circular_shifts_list = new ArrayList<>();
        int lineCount = line_index_.length;
        for(int i = 0; i < lineCount; i ++){
            int chars_pointer = line_index_[i];
            for(int j = 0; j < line_word_count_[i]; j ++){
                circular_shifts_list.add(new Integer[]{i, chars_pointer});
                while(chars_pointer < chars_.length && chars_[chars_pointer] != ' ')
                    chars_pointer ++;
                chars_pointer ++;
            }
        }
        circular_shifts_ = new int[circular_shifts_list.size()][2];
        for(int i = 0; i < circular_shifts_list.size(); i ++){
            for(int j = 0; j < 2; j ++){
                circular_shifts_[i][j] = circular_shifts_list.get(i)[j];
            }
        }
    }

//----------------------------------------------------------------------

    /**
     * This function sorts circular shifts lines alphabetically. The sorted shifts
     * are represented in the same way as the unsorted shifts with the only difference
     * that now they are ordered alphabetically. This function implements binary search
     * to sort the shifts.
     */

    public void alphabetizing() {
        List<Pair> mapping = new ArrayList<>();
        for(int i = 0; i < circular_shifts_.length; i ++){
            StringBuilder shift_result = new StringBuilder();
            int lineNo = circular_shifts_[i][0], start = circular_shifts_[i][1];
            int end = 0;
            if(lineNo == line_index_.length-1) end = chars_.length;
            else end = line_index_[lineNo + 1];
            for(int j = start; j < end; j ++)shift_result.append(chars_[j]);
            if(start != line_index_[lineNo]) {
                shift_result.append(" ");
                for (int j = line_index_[lineNo]; j < start-1; j ++)shift_result.append(chars_[j]);
            }
            mapping.add(new Pair(shift_result.toString(), circular_shifts_[i]));
        }
        Collections.sort(mapping, (p1, p2)->p1.line.compareTo(p2.line));

        alphabetized_ = new int[mapping.size()][2];
        for(int i = 0; i < alphabetized_.length; i ++){
            alphabetized_[i] = mapping.get(i).circular;
        }
    }

//----------------------------------------------------------------------

    /**
     * This function prints the sorted shifts at the standard output.
     */

    public void output() {
        for(int i = 0; i < alphabetized_.length; i ++){
            int lineNo = alphabetized_[i][0], start = alphabetized_[i][1];
            StringBuilder line = new StringBuilder();
            int end = 0;
            if(lineNo == line_index_.length-1)end = chars_.length;
            else end = line_index_[lineNo+1];
            for(int j = start; j < end; j ++)line.append(chars_[j]);

            if(start != line_index_[lineNo]){
                line.append(" ");
                for(int j = line_index_[lineNo]; j < start-1; j ++)
                    line.append(chars_[j]);
            }

            System.out.println(line);
        }
    }

//----------------------------------------------------------------------

    /**
     * This function controls all other functions in the system. It implements
     * the sequence of calls to other functions to obtain the desired functionality
     * of the system. Before any other function is called, main function checks the
     * command line arguments. The program expects exactly one command line argument
     * specifying the name of the file that contains the data. If the program have
     * not been started with proper command line arguments, main function exits
     * with an error message. Otherwise, the input function is called first to read the
     * data from the file. After that the circularShift and alphabetizing
     * functions are called to produce and sort the shifts respectivelly. Finally, the output
     * function prints the sorted shifts at the standard output.
     *
     * @param args command line argumnets
     */

    public static void main(String[] args) {
        KWIC kwic = new KWIC();
        kwic.input("Test_Case.txt");
        kwic.circularShift();
        kwic.alphabetizing();
        kwic.output();
    }

//----------------------------------------------------------------------
/**
 * Inner classes
 *
 */
//----------------------------------------------------------------------
private class Pair {
    String line;
    int[] circular;

    Pair(String line, int[] circular){
        this.line = line;
        this.circular = circular;
    }
}
}
