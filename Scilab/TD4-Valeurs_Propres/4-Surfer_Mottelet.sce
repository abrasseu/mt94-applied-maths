function [U,G] = surfer(root,n)
  // SURFER  Create the adjacency graph of a portion of the Web.
  //    [U,G] = surfer(root,n) starts at the URL root and follows
  //    Web links until it forms an adjacency graph with n nodes.
  //    U = a cell array of n strings, the URLs of the nodes.
  //    G = an n-by-n sparse matrix with G(i,j)=1 if node j is linked to node i.
  //
  //    Example:  [U,G] = surfer('https://www.utc.fr',1O);
  // 
  // adapted from Cleve Moler code.
  //
  // Remove lines 61-63 to free the utc.fr boundary...

  U = [];
  hash = zeros(n,1);
  G = spzeros(n,n);
  m = 1;
  U = root;
  hash(m) = hashfun(root);

  j = 1;
  while (j <= m) & (m<=n) 

    printf('getting (%d) %s\n',j,U(j))
    page = unix_g(sprintf("curl -m 5 -k %s",U(j)));
    page = stripblanks(strcat(page));

    // Follow the links from the open page.

    base = "";
    ind1 = strindex(page,'base href = ""');
    if ~isempty(ind1)
      ind2 = min(strindex(part(page,ind1+11:$),'""'))
      base = part(page,ind1+11:ind1+ind2+9)
    end

    http_index = strindex(page,'a href=""');

    for f = http_index

      // A link starts with 'http:' and ends with the next quote.
      e = strindex(part(page,f:$),'""')

      if isempty(e), continue, end

      url = stripblanks(part(page,f+e(1):f+e(2)-2));
      urlascii = ascii(url);
      urlascii(urlascii<32) = 33;   // Nonprintable characters
      url = ascii(urlascii);

      if url=="http://www" |  url=="http://www." | url=="http://ssl" |  url=="http://ssl." | url=="http://" | url=="http:/" | url=="http:"
        continue
      end

      if isempty(strindex(url,"http")) & isempty(strindex(url,"https"))
        url = base+url
      end

      if isempty(strindex(url,"utc.fr"))
        continue
      end  

      try
        diese=strindex(url,"#")
        if ~isempty(diese)
          url = part(url,1:diese-1)
        end
      catch
        continue
      end

      while part(url, $)=='/'
        url = part(url,1:$-1)
      end

      // Look for links that should be skipped (images, ...)

      skips = ['!','?','rss','purl.org','.ico','.mp4','.mov','.js','.exe','.zip','.dmg','.gz',...
      '.tgz','.rar','.png','.jpeg','.gif','.jpg','.pdf','.css','lmscadsi',...
      'cybernet','search.cgi','.ram','www.w3.org', ...
      'scripts','netscape','shockwave','webex','fansonly',...
      'xmlns','schema.org','ogp.me','typo','rdf','drupal',...
      'apple','isotools','clip-bucket','\/','logp4','logp5',...
      'piwik','gmpg','adobe','macromedia','schema','yoyodesign','mozilla',...
      'microsoft','tif','doc','pdf','eps','ai','pptx'];

      k = 0;
      skip=%f;
      while ~skip & (k < size(skips,'*'))
        k = k+1;
        skip = ~isempty(strindex(url,skips(k)));
      end

      if skip, continue, end

      // Check if page is already in url list.


      i = 0;
      for k = find(hash(1:m) == hashfun(url))
        if U(k)==url
          i = k;
          break
        end
      end

      // Add a new url to the graph there if are fewer than n.

      if (i == 0) & (m < n)
        m = m+1;
        U(m) = url;
        hash(m) = hashfun(url);
        i = m;
        printf('New URL (%d) : %s\n',m,url)
      end

      // Add a new link.

      if i > 0
        printf('New LINK -> %s\n',U(i))
        G(i,j) = 1;
      end

    end

    j = j+1;
  end

  G = G(1:m,1:m)
  U = U(1:m)
  
  G = G - diag(diag(G)) // remove self-references

endfunction

function h = hashfun(url)
  // Almost unique numeric hash code for pages already visited.
  h = length(url) + 1024*sum(ascii(url));
endfunction

[U,C] = surfer("https://www.utc.fr", 1000);

save surfdata.dat U C;

