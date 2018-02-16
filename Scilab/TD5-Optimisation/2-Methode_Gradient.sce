function [x, k] = methodeGradient(x, f, gradf, pas, ITE_MAX, EPS, plotIsoCurve)
    if plotIsoCurve==1 then
        exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\trace_iso.sce");
        plotIso(x);
    end
    grad = gradf(x);
    gradIni = norm(grad);

    for k=1:ITE_MAX
        if norm(grad) < gradIni*EPS then
            break;
        end
        
        p = pas(x, grad);
        oldx = x;
        x = x - p*grad;

        if plotIsoCurve==1 then
            plotIso(x);
        end
        plot([oldx(1) x(1)], [oldx(2), x(2)], 'r', 'linewidth',2);

        grad = gradf(x);    
    end
endfunction
