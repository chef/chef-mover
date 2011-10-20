-record(org, {guid,
              name,
              preloaded = false,
              read_only = false,
              active = false,
              migrated = false,
              worker = undefined,
              time = []}).

-record(node, {id,                              % guid for node data doc in couchdb
               name,                            % node name
               org_id,                          % guid for org
               authz_id,                        %
               requestor,                       % authz id for requesting actor
               status = couchdb,                % couchdb | mysql | {error, term()}
               solr = couchdb}).                % couchdb | both | mysql

-define(ORG_ESTIMATE, 10000).
-define(NODE_ESTIMATE, 25000).

-define(fix_table(Tab, Expr),
        begin
            dets:safe_fixtable(Tab, true),
            try
                Expr
            after
                dets:safe_fixtable(Tab, false)
            end
        end).