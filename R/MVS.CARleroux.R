MVS.CARleroux <- function(formula, family, data=NULL,  trials=NULL, W, burnin, n.sample, thin=1, prior.mean.beta=NULL, prior.var.beta=NULL, prior.nu2=NULL, prior.Sigma.df=NULL, prior.Sigma.scale=NULL, rho=NULL, MALA=FALSE, verbose=TRUE)
{
    #### This is a wrapper function that calls one of
    ## binomial.MVlerouxCAR
    ## poisson.MVlerouxCAR
    ## multinomial.MVlerouxCAR
    if(is.null(family)) stop("the family argument is missing", call.=FALSE)
    
    #### Run the appropriate model according to the family arugment
    if(family=="binomial")
    {
        if(is.null(trials)) stop("a binomial model was specified but the trials arugment was not specified", call.=FALSE)
        model <- binomial.MVlerouxCAR(formula=formula, data=data,  trials=trials, W=W, burnin=burnin, n.sample=n.sample, thin=thin, prior.mean.beta=prior.mean.beta, prior.var.beta=prior.var.beta, prior.Sigma.df=prior.Sigma.df, prior.Sigma.scale=prior.Sigma.scale, rho=rho, MALA=MALA, verbose=verbose)
    }else if(family=="poisson")
    {
        if(!is.null(trials)) stop("you do not need a trials arugment as a binomial model was not specified", call.=FALSE)
        model <- poisson.MVlerouxCAR(formula=formula, data=data, W=W, burnin=burnin, n.sample=n.sample, thin=thin, prior.mean.beta=prior.mean.beta, prior.var.beta=prior.var.beta, prior.Sigma.df=prior.Sigma.df, prior.Sigma.scale=prior.Sigma.scale, rho=rho, MALA=MALA, verbose=verbose)
    }else if(family=="gaussian")
    {
        if(!is.null(trials)) stop("you do not need a trials arugment as a binomial model was not specified", call.=FALSE)
        model <- gaussian.MVlerouxCAR(formula=formula, data=data, W=W, burnin=burnin, n.sample=n.sample, thin=thin, prior.mean.beta=prior.mean.beta, prior.var.beta=prior.var.beta, prior.nu2=prior.nu2, prior.Sigma.df=prior.Sigma.df, prior.Sigma.scale=prior.Sigma.scale, rho=rho, MALA=MALA, verbose=verbose)
    }else if(family=="multinomial")
    {
        if(is.null(trials)) stop("a multinomial model was specified but the trials arugment was not specified", call.=FALSE)
        model <- multinomial.MVlerouxCAR(formula=formula, data=data,  trials=trials, W=W, burnin=burnin, n.sample=n.sample, thin=thin, prior.mean.beta=prior.mean.beta, prior.var.beta=prior.var.beta, prior.Sigma.df=prior.Sigma.df, prior.Sigma.scale=prior.Sigma.scale, rho=rho, verbose=verbose)
        
    }else
    {
        stop("the family arugment is not one of `binomial' or `poisson'.", call.=FALSE)     
    }
    return(model)     
}


