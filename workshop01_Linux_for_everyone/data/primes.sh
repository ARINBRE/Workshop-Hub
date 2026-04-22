#!/usr/bin/bash

## A simple script to generate all primes between 0-100 and 100-200, and 0-10000
## Results are in text files in a new directory called "primes"

## Function to check if a number is prime
is_prime() {
  local n="$1"
  # 0 and 1 are not prime
  if (( n < 2 )); then
    return 1
  fi
  # 2 is prime
  if (( n == 2 )); then
    return 0
  fi
  # even numbers > 2 are not prime
  if (( n % 2 == 0 )); then
    return 1
  fi

  local i=3
  # test odd divisors up to sqrt(n)
  while (( i * i <= n )); do
    if (( n % i == 0 )); then
      return 1
    fi
    (( i += 2 ))
  done

  return 0
}

## Create primes directory
mkdir -p primes

echo "$(date): Generating prime numbers"

## Generate primes between 2 and 100
for (( n=2; n<=100; n++ )); do
  if is_prime "$n"; then
    echo "$n"
  fi
done > primes/primes100.dat

## Generate primes between 100 and 200
for (( n=100; n<=200; n++ )); do
  if is_prime "$n"; then
    echo "$n"
  fi
done > primes/primes200.dat

## Generate primes between 2 and 10000
for (( n=2; n<=10000; n++ )); do
  if is_prime "$n"; then
    echo "$n"
  fi
done > primes/primes10000.dat

## Shuffle the largest prime numbers file
sort -R primes/primes10000.dat > primes/randomprimes.dat

echo "$(date): Prime number generation complete"


exit
