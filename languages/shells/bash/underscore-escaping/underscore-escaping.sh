#!/bin/bash
enable -n echo

print-first-argument() {
    echo
    echo $1
    echo
    echo
}

NOSPACES='this-variable-has-no-spaces'
SPACES='''this variable has    spaces'

echo '!spaces, !quote echo, !quote print-first-argument' $NOSPACES && print-first-argument $_
echo '!spaces, !quote echo,  quote print-first-argument' $NOSPACES && print-first-argument "$_"
echo '!spaces,  quote echo, !quote print-first-argument' "$NOSPACES" && print-first-argument $_
echo '!spaces,  quote echo,  quote print-first-argument' "$NOSPACES" && print-first-argument "$_"
echo
echo ' spaces, !quote echo, !quote print-first-argument' $SPACES && print-first-argument $_
echo ' spaces, !quote echo,  quote print-first-argument' $SPACES && print-first-argument "$_"
echo ' spaces,  quote echo, !quote print-first-argument' "$SPACES" && print-first-argument $_
echo ' spaces,  quote echo,  quote print-first-argument' "$SPACES" && print-first-argument "$_"

exit
echo '!spaces, !quote echo1, !quote echo2' $NOSPACES && echo $_ | print-first-argument
echo '!spaces, !quote echo1,  quote echo2' $NOSPACES && echo "$_" | print-first-argument
echo '!spaces,  quote echo1, !quote echo2' "$NOSPACES" && echo $_ | print-first-argument
echo '!spaces,  quote echo1,  quote echo2' "$NOSPACES" && echo "$_" | print-first-argument
echo
echo ' spaces, !quote echo1, !quote echo2' $SPACES && echo $_ | print-first-argument
echo ' spaces, !quote echo1,  quote echo2' $SPACES && echo "$_" | print-first-argument
echo ' spaces,  quote echo1, !quote echo2' "$SPACES" && echo $_ | print-first-argument
echo ' spaces,  quote echo1,  quote echo2' "$SPACES" && echo "$_" | print-first-argument

# I also at one point played around with tee /dev/stderr,
# but the out-of-order outputs made the actual data unclear

exit
echo '!spaces, !quote echo1, !quote echo2' $NOSPACES && echo $_ | tee -a wat | print-first-argument
echo '!spaces, !quote echo1,  quote echo2' $NOSPACES && echo "$_" | tee -a wat | print-first-argument
echo '!spaces,  quote echo1, !quote echo2' "$NOSPACES" && echo $_ | tee -a wat | print-first-argument
echo '!spaces,  quote echo1,  quote echo2' "$NOSPACES" && echo "$_" | tee -a wat | print-first-argument
echo
echo ' spaces, !quote echo1, !quote echo2' $SPACES && echo $_ | tee -a wat | print-first-argument
echo ' spaces, !quote echo1,  quote echo2' $SPACES && echo "$_" | tee -a wat | print-first-argument
echo ' spaces,  quote echo1, !quote echo2' "$SPACES" && echo $_ | tee -a wat | print-first-argument
echo ' spaces,  quote echo1,  quote echo2' "$SPACES" && echo "$_" | tee -a wat | print-first-argument
