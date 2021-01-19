################################################################################
#
# benchmarks.jl
# =============
# 
# A benchmark file used to measure the timings of the computation of embeddings
# of finite fields with the Bosma-Canon-Steel framework.
#
################################################################################

using Nemo, Primes

dir = dirname(@__FILE__)

"""
    function greatest_common_subfield(K, L)

Return the degree of the 
"""
function greatest_common_subfield(K, L)
    subfieldsL = keys(Nemo.subfields(L))
    subfieldsK = Nemo.subfields(K)
    lcm_L = 1
    lcm_K = 1
    for d in subfieldsL
        lcm_L = lcm(lcm_L, d)
        if haskey(subfieldsK, d)
            lcm_K = lcm(lcm_K, d)
        end
    end
    return lcm_K, gcd(lcm_L, degree(K))
end

function fixed_prime(p, upto, str = "embeddings")

    path = joinpath(dir, string(str, "-", p, ".txt"))
    io = open(path, "w+")

    for i in 1:upto
        for j in (i+1):upto
            if j%i == 0
                println(string(i, " ... ", j))
                k, x = FiniteField(p, i, "x")
                K, y = FiniteField(p, j, "y")
                lcms = greatest_common_subfield(k, K)
                t = @elapsed embed(k, K)

                write(io, string(i, ",", j, ",", lcms[1], ",", lcms[2],
                                 ",", t, "\n"))
            end
        end
    end
    close(io)
end

function fixed_prime_reverse(p, upto, str = "embeddings-reverse")

    path = joinpath(dir, string(str, "-", p, ".txt"))
    io = open(path, "w+")

    for i in 1:upto
        for j in upto:-1:(i+1)
            if j%i == 0
                println(string(i, " ... ", j))
                k, x = FiniteField(p, i, "x")
                K, y = FiniteField(p, j, "y")
                lcms = greatest_common_subfield(k, K)
                t = @elapsed embed(k, K)

                write(io, string(i, ",", j, ",", lcms[1], ",", lcms[2],
                                 ",", t, "\n"))
            end
        end
    end
    close(io)
end

function fixed_prime_reverse_full(p, upto, str = "embeddings-reverse-full")

    path = joinpath(dir, string(str, "-", p, ".txt"))
    io = open(path, "w+")

    for i in upto:-1:1
        for j in upto:-1:(i+1)
            if j%i == 0
                println(string(i, " ... ", j))
                k, x = FiniteField(p, i, "x")
                K, y = FiniteField(p, j, "y")
                lcms = greatest_common_subfield(k, K)
                t = @elapsed embed(k, K)

                write(io, string(i, ",", j, ",", lcms[1], ",", lcms[2],
                                 ",", t, "\n"))
            end
        end
    end
    close(io)
end

function embed_primes(m, n, N, str = "embeddings-primes")
    path = joinpath(dir, string(str, "-from-", m, "-to-", n, ".txt"))
    io = open(path, "w+")

    P = primes(2, N)

    for p in P
        println(p)
        k, x = FiniteField(p, m, "x")
        K, y = FiniteField(p, n, "y")
        t = @elapsed embed(k, K)
        write(io, string(p, ",", t, "\n"))
    end

    close(io)
end

function embed_primes_exp(m, n, N, str = "embeddings-primes-exp")
    path = joinpath(dir, string(str, "-from-", m, "-to-", n, ".txt"))
    io = open(path, "w+")

    for j in 1:N

        println(j)
        p = nextprime(2^j)
        k, x = FiniteField(p, m, "x")
        K, y = FiniteField(p, n, "y")
        t = @elapsed embed(k, K)
        write(io, string(j, ",", t, "\n"))
    end

    close(io)
end
