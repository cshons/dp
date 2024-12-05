//consecutive '111'
#include <iostream>
#include <string>
using namespace std;
// Function to simulate the FA
bool simulateFA(const string& input) {
    int state = 0;
    for (char c : input) {
        if (c == '1') {
            if (state < 3) state++; // Move to the next state on '1'
        } else {
            state = 0; // Reset state on '0'
        }
        if (state == 3) return true; // Accept as soon as "111" is reached
    }
    return false; // Reject if "111" is not found
}
int main() {
    string input;
    cout << "Enter a binary string: ";
    cin >> input;
    if (simulateFA(input)) {
        cout << "The string is accepted by the FA!" << endl;
    } else {
        cout << "The string is rejected by the FA!" << endl;
    }
    return 0;
}

//exactly two or exactly three

#include <iostream>
#include <string>
using namespace std;
// Function to simulate the FA
bool simulateFA(const string& input) {
    int state = 0;
    for (char c : input) {
        if (c == '1') {
            state++; // Move to the next state on '1'
        }
        if (state > 3) return false; // Reject if more than 3 ones
    }
    // Accept if the FA ends in state 2 or 3
    return (state == 2 || state == 3);
}
int main() {
    string input;
    cout << "Enter a binary string: ";
    cin >> input;
    if (simulateFA(input)) {
        cout << "The string is accepted by the FA!" << endl;
    } else {
        cout << "The string is rejected by the FA!" << endl;
    }
    return 0;
}

//Design a Finite Automata (FA) that accepts language L1, 
over S={a, b}, comprising of all strings (of length 4 or more) having first two characters same as the last two. 

#include <iostream>
#include <string>
using namespace std;

// Function to simulate the FA
bool simulateFA(const string& input) {
    if (input.length() < 4) return false; // Reject if length is less than 4

    // Check if the first two characters match the last two characters
    return (input[0] == input[input.length() - 2] && input[1] == input[input.length() - 1]);
}

int main() {
    string input;

    cout << "Enter a string (only 'a' and 'b'): ";
    cin >> input;

    if (simulateFA(input)) {
        cout << "The string is accepted by the FA!" << endl;
    } else {
        cout << "The string is rejected by the FA!" << endl;
    }

    return 0;
}

//Design a Finite Automata (FA) that accepts language L2, 
over S= {a, b} where L2= a(a+b)*b. 

#include <iostream>
#include <string>
using namespace std;
// Function to simulate the FA
bool simulateFA(const string& input) {
    // The string must be at least 2 characters long
    if (input.length() < 2) return false;
    // Check if the string starts with 'a' and ends with 'b'
    return (input[0] == 'a' && input[input.length() - 1] == 'b');
}
int main() {
    string input;
    cout << "Enter a string (only 'a' and 'b'): ";
    cin >> input;
    if (simulateFA(input)) {
        cout << "The string is accepted by the FA!" << endl;
    } else {
        cout << "The string is rejected by the FA!" << endl;
    }
    return 0;
}

//Design a Finite Automata (FA) that accepts language EVEN-EVEN over S={a, b}.

#include <iostream>
#include <string>
using namespace std;
// Function to simulate the FA
bool simulateFA(const string& input) {
    int stateA = 0; // Tracks even (0) or odd (1) for 'a'
    int stateB = 0; // Tracks even (0) or odd (1) for 'b'
    for (char c : input) {
        if (c == 'a') stateA = 1 - stateA; // Flip state for 'a'
        else if (c == 'b') stateB = 1 - stateB; // Flip state for 'b'
        else return false; // Reject invalid characters
    }
    // Accept if both states are 0 (even counts for both 'a' and 'b')
    return (stateA == 0 && stateB == 0);
}
int main() {
    string input;
    cout << "Enter a string (only 'a' and 'b'): ";
    cin >> input;
    if (simulateFA(input)) {
        cout << "The string is accepted by the FA!" << endl;
    } else {
        cout << "The string is rejected by the FA!" << endl;
    }
    return 0;
}

//Write a program to simulate an FA that accepts 
a. Union of the languages L1 and L2
b. Intersection of the languages L1 and L2
c. Language L1 L2 (concatenation)

#include <iostream>
#include <string>
using namespace std;
// Check if a string belongs to L1 (starts and ends with 'a')
bool isInL1(const string& input) {
    return input.length() >= 2 && input[0] == 'a' && input[input.length() - 1] == 'a';
}
// Check if a string belongs to L2 (contains an even number of 'b's)
bool isInL2(const string& input) {
    int countB = 0;
    for (char c : input) {
        if (c == 'b') countB++;
    }
    return countB % 2 == 0;
}
// Check union of L1 and L2
bool unionOfL1AndL2(const string& input) {
    return isInL1(input) || isInL2(input);
}
// Check intersection of L1 and L2
bool intersectionOfL1AndL2(const string& input) {
    return isInL1(input) && isInL2(input);
}
// Check concatenation of L1 and L2
bool concatenationOfL1AndL2(const string& input) {
    // Split the input into two parts and check if one part is in L1 and the other in L2
    for (size_t i = 1; i < input.length(); i++) {
        string part1 = input.substr(0, i);
        string part2 = input.substr(i);
        if (isInL1(part1) && isInL2(part2)) return true;
    }
    return false;
}
int main() {
    string input;
    cout << "Enter a string (only 'a' and 'b'): ";
    cin >> input;
    cout << "Union of L1 and L2: " 
         << (unionOfL1AndL2(input) ? "Accepted" : "Rejected") << endl;
    cout << "Intersection of L1 and L2: " 
         << (intersectionOfL1AndL2(input) ? "Accepted" : "Rejected") << endl;
    cout << "Concatenation of L1 and L2: " 
         << (concatenationOfL1AndL2(input) ? "Accepted" : "Rejected") << endl;
    return 0;
}

//Design a PDA and write a program for simulating the machine which accepts the language 
 {anbn where n>0, S= {a, b}}.

#include <iostream>
#include <stack>
#include <string>
using namespace std;
// Function to simulate the PDA
bool simulatePDA(const string& input) {
    stack<char> pdaStack;
    int state = 0;
    for (char c : input) {
        if (state == 0) {
            if (c == 'a') {
                // Push 'a' onto the stack
                pdaStack.push('a');
            } else if (c == 'b') {
                if (!pdaStack.empty() && pdaStack.top() == 'a') {
                    // Pop 'a' for each 'b'
                    pdaStack.pop();
                    state = 1; // Transition to processing 'b's
                } else {
                    return false; // Invalid transition
                }
            } else {
                return false; // Invalid character
            }
        } else if (state == 1) {
            if (c == 'b') {
                if (!pdaStack.empty() && pdaStack.top() == 'a') {
                    // Continue popping 'a' for 'b'
                    pdaStack.pop();
                } else {
                    return false; // Invalid transition
                }
            } else {
                return false; // 'a' after 'b' is invalid
            }
        }
    }
    // Accept if the stack is empty
    return pdaStack.empty();
}
int main() {
    string input;
    cout << "Enter a string (only 'a' and 'b'): ";
    cin >> input;
    if (simulatePDA(input)) {
        cout << "The string is accepted by the PDA!" << endl;
    } else {
        cout << "The string is rejected by the PDA!" << endl;
    }
    return 0;
}

//Design a PDA and write a program for simulating the machine which accepts the language {wXwr| w 
is any string over S={a, b} and wr is reverse of that string and X is a special symbol }.

#include <iostream>
#include <stack>
#include <string>
using namespace std;

// Function to simulate the PDA
bool simulatePDA(const string& input) {
    stack<char> pdaStack;
    int state = 0;  // Start at state q0
    for (char c : input) {
        if (state == 0) {
            if (c == 'a' || c == 'b') {
                // Push 'a' or 'b' onto the stack
                pdaStack.push(c);
            } else if (c == 'X') {
                // Move to state q1 when 'X' is encountered
                state = 1;
            } else {
                return false; // Invalid character
            }
        } else if (state == 1) {
            if (c == 'a' || c == 'b') {
                if (pdaStack.empty()) {
                    return false; // If stack is empty, the string is invalid
                }
                // Pop from stack and check if it matches the current character
                if (pdaStack.top() == c) {
                    pdaStack.pop();
                } else {
                    return false; // Mismatch, reject the string
                }
            } else {
                return false; // Invalid character after X
            }
        }
    }
    // Accept if the stack is empty after processing the whole string
    return pdaStack.empty();
}
int main() {
    string input;
    cout << "Enter a string (only 'a', 'b', and 'X'): ";
    cin >> input;
    if (simulatePDA(input)) {
        cout << "The string is accepted by the PDA!" << endl;
    } else {
        cout << "The string is rejected by the PDA!" << endl;
    }
    return 0;
}

//Design and simulate a Turing Machine that accepts the language anbncn where n >0

#include <iostream>
#include <string>
using namespace std;
// Function to simulate the Turing Machine
bool simulateTM(string& tape) {
    int head = 0;
    int state = 0;
    int n = tape.length();
    while (head < n) {
        switch (state) {
            case 0: // q0: Start state, process 'a'
                if (tape[head] == 'a') {
                    tape[head] = 'X'; // Mark 'a' as processed
                    head++; // Move to next symbol
                    state = 1; // Move to state q1 to process 'b'
                } else {
                    return false; // Reject if not 'a'
                }
                break;
            case 1: // q1: Find matching 'b'
                if (tape[head] == 'b') {
                    tape[head] = 'Y'; // Mark 'b' as processed
                    head++; // Move to next symbol
                    state = 2; // Move to state q2 to process 'c'
                } else {
                    return false; // Reject if not 'b'
                }
                break;
            case 2: // q2: Find matching 'c'
                if (tape[head] == 'c') {
                    tape[head] = 'Z'; // Mark 'c' as processed
                    head = 0; // Return to the beginning to start the next round
                    state = 3; // Move to state q3 to repeat the process
                } else {
                    return false; // Reject if not 'c'
                }
                break;
            case 3: // q3: Go to the start to check next unmarked 'a'
                bool found = false;
                while (head < n && tape[head] == 'X') {
                    head++; // Skip marked 'a's
                }
                if (head < n && tape[head] == 'a') {
                    found = true;
                }
                if (found) {
                    state = 0; // Go back to process the next 'a'
                } else {
                    // Check if we have processed everything
                    for (int i = 0; i < n; i++) {
                        if (tape[i] != 'X' && tape[i] != 'Y' && tape[i] != 'Z') {
                            return false; // Reject if there are unmarked characters
                        }
                    }
                    return true; // Accept if all characters are processed
                }
                break;
        }
    }
    return false;
}
int main() {
    string input;
    cout << "Enter a string (only 'a', 'b', and 'c'): ";
    cin >> input;
    // Check if the string is of the form a^n b^n c^n
    if (simulateTM(input)) {
        cout << "The string is accepted by the Turing Machine!" << endl;
    } else {
        cout << "The string is rejected by the Turing Machine!" << endl;
    }
    return 0;
}

//Design and simulate a Turing Machine which will increment the given binary number by 1

#include <iostream>
#include <string>
using namespace std;
// Function to simulate the Turing Machine that increments a binary number
void incrementBinaryNumber(string &tape) {
    int head = tape.length() - 1;  // Start from the rightmost bit
    int state = 0;  // Initial state
    while (head >= 0) {
        if (state == 0) {  // q0: Find the rightmost 0 or 1
            if (tape[head] == '0') {
                tape[head] = '1';  // Change 0 to 1 and stop (increment done)
                state = 1;  // Move to accepting state
                break;
            } else if (tape[head] == '1') {
                tape[head] = '0';  // Change 1 to 0 (carry over)
                head--;  // Move left to propagate the carry
            }
        }
    }
    // If the carry is left and we finished the loop, prepend '1' to the string
    if (state == 0 && tape[0] == '0') {
        tape = '1' + tape;
    }
}
int main() {
    string input;
    cout << "Enter a binary number: ";
    cin >> input;
    // Increment the binary number by 1
    incrementBinaryNumber(input);
    // Output the result
    cout << "The incremented binary number is: " << input << endl;
    return 0;
}
