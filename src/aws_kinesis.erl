%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/jkakar/aws-codegen for more details.

%% @doc <fullname>Amazon Kinesis Streams Service API Reference</fullname>
%%
%% Amazon Kinesis Streams is a managed service that scales elastically for
%% real time processing of streaming big data.
-module(aws_kinesis).

-export([add_tags_to_stream/2,
         add_tags_to_stream/3,
         create_stream/2,
         create_stream/3,
         copy_object/3,
         delete_object/2,
         decrease_stream_retention_period/2,
         decrease_stream_retention_period/3,
         delete_stream/2,
         delete_stream/3,
         describe_stream/2,
         describe_stream/3,
         disable_enhanced_monitoring/2,
         disable_enhanced_monitoring/3,
         enable_enhanced_monitoring/2,
         enable_enhanced_monitoring/3,
         get_records/2,
         get_records/3,
         get_shard_iterator/2,
         get_shard_iterator/3,
         increase_stream_retention_period/2,
         increase_stream_retention_period/3,
         list_streams/2,
         list_streams/3,
         list_tags_for_stream/2,
         list_tags_for_stream/3,
         merge_shards/2,
         merge_shards/3,
         put_record/2,
         put_record/3,
         put_records/2,
         put_records/3,
         remove_tags_from_stream/2,
         remove_tags_from_stream/3,
         split_shard/2,
         split_shard/3,
         vega_sign/3]).

-include_lib("hackney/include/hackney_lib.hrl").



%%====================================================================
%% API
%%====================================================================


vega_sign(Client, Signature, Method) ->
  request_vega(Client, <<"s3">>, Signature, Method).

copy_object(Client, Source, Method) ->
  request_copy(Client, <<"s3">>, Source, Method).

delete_object(Client, Method) ->
  request_delete(Client, <<"s3">>, Method).

%% @doc Adds or updates tags for the specified Amazon Kinesis stream. Each
%% stream can have up to 10 tags.
%%
%% If tags have already been assigned to the stream,
%% <code>AddTagsToStream</code> overwrites any existing tags that correspond
%% to the specified tag keys.
add_tags_to_stream(Client, Input)
  when is_map(Client), is_map(Input) ->
    add_tags_to_stream(Client, Input, []).
add_tags_to_stream(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"AddTagsToStream">>, Input, Options).

%% @doc Creates an Amazon Kinesis stream. A stream captures and transports
%% data records that are continuously emitted from different data sources or
%% <i>producers</i>. Scale-out within a stream is explicitly supported by
%% means of shards, which are uniquely identified groups of data records in a
%% stream.
%%
%% You specify and control the number of shards that a stream is composed of.
%% Each shard can support reads up to 5 transactions per second, up to a
%% maximum data read total of 2 MB per second. Each shard can support writes
%% up to 1,000 records per second, up to a maximum data write total of 1 MB
%% per second. You can add shards to a stream if the amount of data input
%% increases and you can remove shards if the amount of data input decreases.
%%
%% The stream name identifies the stream. The name is scoped to the AWS
%% account used by the application. It is also scoped by region. That is, two
%% streams in two different accounts can have the same name, and two streams
%% in the same account, but in two different regions, can have the same name.
%%
%% <code>CreateStream</code> is an asynchronous operation. Upon receiving a
%% <code>CreateStream</code> request, Amazon Kinesis immediately returns and
%% sets the stream status to <code>CREATING</code>. After the stream is
%% created, Amazon Kinesis sets the stream status to <code>ACTIVE</code>. You
%% should perform read and write operations only on an <code>ACTIVE</code>
%% stream.
%%
%% You receive a <code>LimitExceededException</code> when making a
%% <code>CreateStream</code> request if you try to do one of the following:
%%
%% <ul> <li>Have more than five streams in the <code>CREATING</code> state at
%% any point in time.</li> <li>Create more shards than are authorized for
%% your account.</li> </ul> For the default shard limit for an AWS account,
%% see <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html">Streams
%% Limits</a> in the <i>Amazon Kinesis Streams Developer Guide</i>. If you
%% need to increase this limit, <a
%% href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">contact
%% AWS Support</a>.
%%
%% You can use <code>DescribeStream</code> to check the stream status, which
%% is returned in <code>StreamStatus</code>.
%%
%% <a>CreateStream</a> has a limit of 5 transactions per second per account.
create_stream(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_stream(Client, Input, []).
create_stream(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateStream">>, Input, Options).

%% @doc Decreases the Amazon Kinesis stream's retention period, which is the
%% length of time data records are accessible after they are added to the
%% stream. The minimum value of a stream's retention period is 24 hours.
%%
%% This operation may result in lost data. For example, if the stream's
%% retention period is 48 hours and is decreased to 24 hours, any data
%% already in the stream that is older than 24 hours is inaccessible.
decrease_stream_retention_period(Client, Input)
  when is_map(Client), is_map(Input) ->
    decrease_stream_retention_period(Client, Input, []).
decrease_stream_retention_period(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DecreaseStreamRetentionPeriod">>, Input, Options).

%% @doc Deletes an Amazon Kinesis stream and all its shards and data. You
%% must shut down any applications that are operating on the stream before
%% you delete the stream. If an application attempts to operate on a deleted
%% stream, it will receive the exception
%% <code>ResourceNotFoundException</code>.
%%
%% If the stream is in the <code>ACTIVE</code> state, you can delete it.
%% After a <code>DeleteStream</code> request, the specified stream is in the
%% <code>DELETING</code> state until Amazon Kinesis completes the deletion.
%%
%% <b>Note:</b> Amazon Kinesis might continue to accept data read and write
%% operations, such as <a>PutRecord</a>, <a>PutRecords</a>, and
%% <a>GetRecords</a>, on a stream in the <code>DELETING</code> state until
%% the stream deletion is complete.
%%
%% When you delete a stream, any shards in that stream are also deleted, and
%% any tags are dissociated from the stream.
%%
%% You can use the <a>DescribeStream</a> operation to check the state of the
%% stream, which is returned in <code>StreamStatus</code>.
%%
%% <a>DeleteStream</a> has a limit of 5 transactions per second per account.
delete_stream(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_stream(Client, Input, []).
delete_stream(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteStream">>, Input, Options).

%% @doc Describes the specified Amazon Kinesis stream.
%%
%% The information about the stream includes its current status, its Amazon
%% Resource Name (ARN), and an array of shard objects. For each shard object,
%% there is information about the hash key and sequence number ranges that
%% the shard spans, and the IDs of any earlier shards that played in a role
%% in creating the shard. A sequence number is the identifier associated with
%% every record ingested in the stream. The sequence number is assigned when
%% a record is put into the stream.
%%
%% You can limit the number of returned shards using the <code>Limit</code>
%% parameter. The number of shards in a stream may be too large to return
%% from a single call to <code>DescribeStream</code>. You can detect this by
%% using the <code>HasMoreShards</code> flag in the returned output.
%% <code>HasMoreShards</code> is set to <code>true</code> when there is more
%% data available.
%%
%% <code>DescribeStream</code> is a paginated operation. If there are more
%% shards available, you can request them using the shard ID of the last
%% shard returned. Specify this ID in the <code>ExclusiveStartShardId</code>
%% parameter in a subsequent request to <code>DescribeStream</code>.
%%
%% There are no guarantees about the chronological order shards returned in
%% <code>DescribeStream</code> results. If you want to process shards in
%% chronological order, use <code>ParentShardId</code> to track lineage to
%% the oldest shard.
%%
%% <a>DescribeStream</a> has a limit of 10 transactions per second per
%% account.
describe_stream(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_stream(Client, Input, []).
describe_stream(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeStream">>, Input, Options).

%% @doc Disables enhanced monitoring.
disable_enhanced_monitoring(Client, Input)
  when is_map(Client), is_map(Input) ->
    disable_enhanced_monitoring(Client, Input, []).
disable_enhanced_monitoring(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DisableEnhancedMonitoring">>, Input, Options).

%% @doc Enables enhanced Amazon Kinesis stream monitoring for shard-level
%% metrics.
enable_enhanced_monitoring(Client, Input)
  when is_map(Client), is_map(Input) ->
    enable_enhanced_monitoring(Client, Input, []).
enable_enhanced_monitoring(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"EnableEnhancedMonitoring">>, Input, Options).

%% @doc Gets data records from an Amazon Kinesis stream's shard.
%%
%% Specify a shard iterator using the <code>ShardIterator</code> parameter.
%% The shard iterator specifies the position in the shard from which you want
%% to start reading data records sequentially. If there are no records
%% available in the portion of the shard that the iterator points to,
%% <a>GetRecords</a> returns an empty list. Note that it might take multiple
%% calls to get to a portion of the shard that contains records.
%%
%% You can scale by provisioning multiple shards per stream while considering
%% service limits (for more information, see <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html">Streams
%% Limits</a> in the <i>Amazon Kinesis Streams Developer Guide</i>). Your
%% application should have one thread per shard, each reading continuously
%% from its stream. To read from a stream continually, call <a>GetRecords</a>
%% in a loop. Use <a>GetShardIterator</a> to get the shard iterator to
%% specify in the first <a>GetRecords</a> call. <a>GetRecords</a> returns a
%% new shard iterator in <code>NextShardIterator</code>. Specify the shard
%% iterator returned in <code>NextShardIterator</code> in subsequent calls to
%% <a>GetRecords</a>. Note that if the shard has been closed, the shard
%% iterator can't return more data and <a>GetRecords</a> returns
%% <code>null</code> in <code>NextShardIterator</code>. You can terminate the
%% loop when the shard is closed, or when the shard iterator reaches the
%% record with the sequence number or other attribute that marks it as the
%% last record to process.
%%
%% Each data record can be up to 1 MB in size, and each shard can read up to
%% 2 MB per second. You can ensure that your calls don't exceed the maximum
%% supported size or throughput by using the <code>Limit</code> parameter to
%% specify the maximum number of records that <a>GetRecords</a> can return.
%% Consider your average record size when determining this limit.
%%
%% The size of the data returned by <a>GetRecords</a> varies depending on the
%% utilization of the shard. The maximum size of data that <a>GetRecords</a>
%% can return is 10 MB. If a call returns this amount of data, subsequent
%% calls made within the next 5 seconds throw
%% <code>ProvisionedThroughputExceededException</code>. If there is
%% insufficient provisioned throughput on the shard, subsequent calls made
%% within the next 1 second throw
%% <code>ProvisionedThroughputExceededException</code>. Note that
%% <a>GetRecords</a> won't return any data when it throws an exception. For
%% this reason, we recommend that you wait one second between calls to
%% <a>GetRecords</a>; however, it's possible that the application will get
%% exceptions for longer than 1 second.
%%
%% To detect whether the application is falling behind in processing, you can
%% use the <code>MillisBehindLatest</code> response attribute. You can also
%% monitor the stream using CloudWatch metrics and other mechanisms (see <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/monitoring.html">Monitoring</a>
%% in the <i>Amazon Kinesis Streams Developer Guide</i>).
%%
%% Each Amazon Kinesis record includes a value,
%% <code>ApproximateArrivalTimestamp</code>, that is set when a stream
%% successfully receives and stores a record. This is commonly referred to as
%% a server-side timestamp, whereas a client-side timestamp is set when a
%% data producer creates or sends the record to a stream (a data producer is
%% any data source putting data records into a stream, for example with
%% <a>PutRecords</a>). The timestamp has millisecond precision. There are no
%% guarantees about the timestamp accuracy, or that the timestamp is always
%% increasing. For example, records in a shard or across a stream might have
%% timestamps that are out of order.
get_records(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_records(Client, Input, []).
get_records(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetRecords">>, Input, Options).

%% @doc Gets an Amazon Kinesis shard iterator. A shard iterator expires five
%% minutes after it is returned to the requester.
%%
%% A shard iterator specifies the shard position from which to start reading
%% data records sequentially. The position is specified using the sequence
%% number of a data record in a shard. A sequence number is the identifier
%% associated with every record ingested in the stream, and is assigned when
%% a record is put into the stream. Each stream has one or more shards.
%%
%% You must specify the shard iterator type. For example, you can set the
%% <code>ShardIteratorType</code> parameter to read exactly from the position
%% denoted by a specific sequence number by using the
%% <code>AT_SEQUENCE_NUMBER</code> shard iterator type, or right after the
%% sequence number by using the <code>AFTER_SEQUENCE_NUMBER</code> shard
%% iterator type, using sequence numbers returned by earlier calls to
%% <a>PutRecord</a>, <a>PutRecords</a>, <a>GetRecords</a>, or
%% <a>DescribeStream</a>. In the request, you can specify the shard iterator
%% type <code>AT_TIMESTAMP</code> to read records from an arbitrary point in
%% time, <code>TRIM_HORIZON</code> to cause <code>ShardIterator</code> to
%% point to the last untrimmed record in the shard in the system (the oldest
%% data record in the shard), or <code>LATEST</code> so that you always read
%% the most recent data in the shard.
%%
%% When you read repeatedly from a stream, use a <a>GetShardIterator</a>
%% request to get the first shard iterator for use in your first
%% <a>GetRecords</a> request and for subsequent reads use the shard iterator
%% returned by the <a>GetRecords</a> request in
%% <code>NextShardIterator</code>. A new shard iterator is returned by every
%% <a>GetRecords</a> request in <code>NextShardIterator</code>, which you use
%% in the <code>ShardIterator</code> parameter of the next <a>GetRecords</a>
%% request.
%%
%% If a <a>GetShardIterator</a> request is made too often, you receive a
%% <code>ProvisionedThroughputExceededException</code>. For more information
%% about throughput limits, see <a>GetRecords</a>, and <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html">Streams
%% Limits</a> in the <i>Amazon Kinesis Streams Developer Guide</i>.
%%
%% If the shard is closed, <a>GetShardIterator</a> returns a valid iterator
%% for the last sequence number of the shard. Note that a shard can be closed
%% as a result of using <a>SplitShard</a> or <a>MergeShards</a>.
%%
%% <a>GetShardIterator</a> has a limit of 5 transactions per second per
%% account per open shard.
get_shard_iterator(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_shard_iterator(Client, Input, []).
get_shard_iterator(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetShardIterator">>, Input, Options).

%% @doc Increases the Amazon Kinesis stream's retention period, which is the
%% length of time data records are accessible after they are added to the
%% stream. The maximum value of a stream's retention period is 168 hours (7
%% days).
%%
%% Upon choosing a longer stream retention period, this operation will
%% increase the time period records are accessible that have not yet expired.
%% However, it will not make previous data that has expired (older than the
%% stream's previous retention period) accessible after the operation has
%% been called. For example, if a stream's retention period is set to 24
%% hours and is increased to 168 hours, any data that is older than 24 hours
%% will remain inaccessible to consumer applications.
increase_stream_retention_period(Client, Input)
  when is_map(Client), is_map(Input) ->
    increase_stream_retention_period(Client, Input, []).
increase_stream_retention_period(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"IncreaseStreamRetentionPeriod">>, Input, Options).

%% @doc Lists your Amazon Kinesis streams.
%%
%% The number of streams may be too large to return from a single call to
%% <code>ListStreams</code>. You can limit the number of returned streams
%% using the <code>Limit</code> parameter. If you do not specify a value for
%% the <code>Limit</code> parameter, Amazon Kinesis uses the default limit,
%% which is currently 10.
%%
%% You can detect if there are more streams available to list by using the
%% <code>HasMoreStreams</code> flag from the returned output. If there are
%% more streams available, you can request more streams by using the name of
%% the last stream returned by the <code>ListStreams</code> request in the
%% <code>ExclusiveStartStreamName</code> parameter in a subsequent request to
%% <code>ListStreams</code>. The group of stream names returned by the
%% subsequent request is then added to the list. You can continue this
%% process until all the stream names have been collected in the list.
%%
%% <a>ListStreams</a> has a limit of 5 transactions per second per account.
list_streams(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_streams(Client, Input, []).
list_streams(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListStreams">>, Input, Options).

%% @doc Lists the tags for the specified Amazon Kinesis stream.
list_tags_for_stream(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_tags_for_stream(Client, Input, []).
list_tags_for_stream(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTagsForStream">>, Input, Options).

%% @doc Merges two adjacent shards in an Amazon Kinesis stream and combines
%% them into a single shard to reduce the stream's capacity to ingest and
%% transport data. Two shards are considered adjacent if the union of the
%% hash key ranges for the two shards form a contiguous set with no gaps. For
%% example, if you have two shards, one with a hash key range of 276...381
%% and the other with a hash key range of 382...454, then you could merge
%% these two shards into a single shard that would have a hash key range of
%% 276...454. After the merge, the single child shard receives data for all
%% hash key values covered by the two parent shards.
%%
%% <code>MergeShards</code> is called when there is a need to reduce the
%% overall capacity of a stream because of excess capacity that is not being
%% used. You must specify the shard to be merged and the adjacent shard for a
%% stream. For more information about merging shards, see <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-merge.html">Merge
%% Two Shards</a> in the <i>Amazon Kinesis Streams Developer Guide</i>.
%%
%% If the stream is in the <code>ACTIVE</code> state, you can call
%% <code>MergeShards</code>. If a stream is in the <code>CREATING</code>,
%% <code>UPDATING</code>, or <code>DELETING</code> state,
%% <code>MergeShards</code> returns a <code>ResourceInUseException</code>. If
%% the specified stream does not exist, <code>MergeShards</code> returns a
%% <code>ResourceNotFoundException</code>.
%%
%% You can use <a>DescribeStream</a> to check the state of the stream, which
%% is returned in <code>StreamStatus</code>.
%%
%% <code>MergeShards</code> is an asynchronous operation. Upon receiving a
%% <code>MergeShards</code> request, Amazon Kinesis immediately returns a
%% response and sets the <code>StreamStatus</code> to <code>UPDATING</code>.
%% After the operation is completed, Amazon Kinesis sets the
%% <code>StreamStatus</code> to <code>ACTIVE</code>. Read and write
%% operations continue to work while the stream is in the
%% <code>UPDATING</code> state.
%%
%% You use <a>DescribeStream</a> to determine the shard IDs that are
%% specified in the <code>MergeShards</code> request.
%%
%% If you try to operate on too many streams in parallel using
%% <a>CreateStream</a>, <a>DeleteStream</a>, <code>MergeShards</code> or
%% <a>SplitShard</a>, you will receive a <code>LimitExceededException</code>.
%%
%% <code>MergeShards</code> has limit of 5 transactions per second per
%% account.
merge_shards(Client, Input)
  when is_map(Client), is_map(Input) ->
    merge_shards(Client, Input, []).
merge_shards(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"MergeShards">>, Input, Options).

%% @doc Writes a single data record into an Amazon Kinesis stream. Call
%% <code>PutRecord</code> to send data into the stream for real-time
%% ingestion and subsequent processing, one record at a time. Each shard can
%% support writes up to 1,000 records per second, up to a maximum data write
%% total of 1 MB per second.
%%
%% You must specify the name of the stream that captures, stores, and
%% transports the data; a partition key; and the data blob itself.
%%
%% The data blob can be any type of data; for example, a segment from a log
%% file, geographic/location data, website clickstream data, and so on.
%%
%% The partition key is used by Amazon Kinesis to distribute data across
%% shards. Amazon Kinesis segregates the data records that belong to a stream
%% into multiple shards, using the partition key associated with each data
%% record to determine which shard a given data record belongs to.
%%
%% Partition keys are Unicode strings, with a maximum length limit of 256
%% characters for each key. An MD5 hash function is used to map partition
%% keys to 128-bit integer values and to map associated data records to
%% shards using the hash key ranges of the shards. You can override hashing
%% the partition key to determine the shard by explicitly specifying a hash
%% value using the <code>ExplicitHashKey</code> parameter. For more
%% information, see <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream">Adding
%% Data to a Stream</a> in the <i>Amazon Kinesis Streams Developer Guide</i>.
%%
%% <code>PutRecord</code> returns the shard ID of where the data record was
%% placed and the sequence number that was assigned to the data record.
%%
%% Sequence numbers increase over time and are specific to a shard within a
%% stream, not across all shards within a stream. To guarantee strictly
%% increasing ordering, write serially to a shard and use the
%% <code>SequenceNumberForOrdering</code> parameter. For more information,
%% see <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream">Adding
%% Data to a Stream</a> in the <i>Amazon Kinesis Streams Developer Guide</i>.
%%
%% If a <code>PutRecord</code> request cannot be processed because of
%% insufficient provisioned throughput on the shard involved in the request,
%% <code>PutRecord</code> throws
%% <code>ProvisionedThroughputExceededException</code>.
%%
%% Data records are accessible for only 24 hours from the time that they are
%% added to a stream.
put_record(Client, Input)
  when is_map(Client), is_map(Input) ->
    put_record(Client, Input, []).
put_record(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"PutRecord">>, Input, Options).

%% @doc Writes multiple data records into an Amazon Kinesis stream in a
%% single call (also referred to as a <code>PutRecords</code> request). Use
%% this operation to send data into the stream for data ingestion and
%% processing.
%%
%% Each <code>PutRecords</code> request can support up to 500 records. Each
%% record in the request can be as large as 1 MB, up to a limit of 5 MB for
%% the entire request, including partition keys. Each shard can support
%% writes up to 1,000 records per second, up to a maximum data write total of
%% 1 MB per second.
%%
%% You must specify the name of the stream that captures, stores, and
%% transports the data; and an array of request <code>Records</code>, with
%% each record in the array requiring a partition key and data blob. The
%% record size limit applies to the total size of the partition key and data
%% blob.
%%
%% The data blob can be any type of data; for example, a segment from a log
%% file, geographic/location data, website clickstream data, and so on.
%%
%% The partition key is used by Amazon Kinesis as input to a hash function
%% that maps the partition key and associated data to a specific shard. An
%% MD5 hash function is used to map partition keys to 128-bit integer values
%% and to map associated data records to shards. As a result of this hashing
%% mechanism, all data records with the same partition key map to the same
%% shard within the stream. For more information, see <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream">Adding
%% Data to a Stream</a> in the <i>Amazon Kinesis Streams Developer Guide</i>.
%%
%% Each record in the <code>Records</code> array may include an optional
%% parameter, <code>ExplicitHashKey</code>, which overrides the partition key
%% to shard mapping. This parameter allows a data producer to determine
%% explicitly the shard where the record is stored. For more information, see
%% <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-putrecords">Adding
%% Multiple Records with PutRecords</a> in the <i>Amazon Kinesis Streams
%% Developer Guide</i>.
%%
%% The <code>PutRecords</code> response includes an array of response
%% <code>Records</code>. Each record in the response array directly
%% correlates with a record in the request array using natural ordering, from
%% the top to the bottom of the request and response. The response
%% <code>Records</code> array always includes the same number of records as
%% the request array.
%%
%% The response <code>Records</code> array includes both successfully and
%% unsuccessfully processed records. Amazon Kinesis attempts to process all
%% records in each <code>PutRecords</code> request. A single record failure
%% does not stop the processing of subsequent records.
%%
%% A successfully-processed record includes <code>ShardId</code> and
%% <code>SequenceNumber</code> values. The <code>ShardId</code> parameter
%% identifies the shard in the stream where the record is stored. The
%% <code>SequenceNumber</code> parameter is an identifier assigned to the put
%% record, unique to all records in the stream.
%%
%% An unsuccessfully-processed record includes <code>ErrorCode</code> and
%% <code>ErrorMessage</code> values. <code>ErrorCode</code> reflects the type
%% of error and can be one of the following values:
%% <code>ProvisionedThroughputExceededException</code> or
%% <code>InternalFailure</code>. <code>ErrorMessage</code> provides more
%% detailed information about the
%% <code>ProvisionedThroughputExceededException</code> exception including
%% the account ID, stream name, and shard ID of the record that was
%% throttled. For more information about partially successful responses, see
%% <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-add-data-to-stream.html#kinesis-using-sdk-java-putrecords">Adding
%% Multiple Records with PutRecords</a> in the <i>Amazon Kinesis Streams
%% Developer Guide</i>.
%%
%% By default, data records are accessible for only 24 hours from the time
%% that they are added to an Amazon Kinesis stream. This retention period can
%% be modified using the <a>DecreaseStreamRetentionPeriod</a> and
%% <a>IncreaseStreamRetentionPeriod</a> operations.
put_records(Client, Input)
  when is_map(Client), is_map(Input) ->
    put_records(Client, Input, []).
put_records(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"PutRecords">>, Input, Options).

%% @doc Removes tags from the specified Amazon Kinesis stream. Removed tags
%% are deleted and cannot be recovered after this operation successfully
%% completes.
%%
%% If you specify a tag that does not exist, it is ignored.
remove_tags_from_stream(Client, Input)
  when is_map(Client), is_map(Input) ->
    remove_tags_from_stream(Client, Input, []).
remove_tags_from_stream(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RemoveTagsFromStream">>, Input, Options).

%% @doc Splits a shard into two new shards in the Amazon Kinesis stream to
%% increase the stream's capacity to ingest and transport data.
%% <code>SplitShard</code> is called when there is a need to increase the
%% overall capacity of a stream because of an expected increase in the volume
%% of data records being ingested.
%%
%% You can also use <code>SplitShard</code> when a shard appears to be
%% approaching its maximum utilization; for example, the producers sending
%% data into the specific shard are suddenly sending more than previously
%% anticipated. You can also call <code>SplitShard</code> to increase stream
%% capacity, so that more Amazon Kinesis applications can simultaneously read
%% data from the stream for real-time processing.
%%
%% You must specify the shard to be split and the new hash key, which is the
%% position in the shard where the shard gets split in two. In many cases,
%% the new hash key might simply be the average of the beginning and ending
%% hash key, but it can be any hash key value in the range being mapped into
%% the shard. For more information about splitting shards, see <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-split.html">Split
%% a Shard</a> in the <i>Amazon Kinesis Streams Developer Guide</i>.
%%
%% You can use <a>DescribeStream</a> to determine the shard ID and hash key
%% values for the <code>ShardToSplit</code> and
%% <code>NewStartingHashKey</code> parameters that are specified in the
%% <code>SplitShard</code> request.
%%
%% <code>SplitShard</code> is an asynchronous operation. Upon receiving a
%% <code>SplitShard</code> request, Amazon Kinesis immediately returns a
%% response and sets the stream status to <code>UPDATING</code>. After the
%% operation is completed, Amazon Kinesis sets the stream status to
%% <code>ACTIVE</code>. Read and write operations continue to work while the
%% stream is in the <code>UPDATING</code> state.
%%
%% You can use <code>DescribeStream</code> to check the status of the stream,
%% which is returned in <code>StreamStatus</code>. If the stream is in the
%% <code>ACTIVE</code> state, you can call <code>SplitShard</code>. If a
%% stream is in <code>CREATING</code> or <code>UPDATING</code> or
%% <code>DELETING</code> states, <code>DescribeStream</code> returns a
%% <code>ResourceInUseException</code>.
%%
%% If the specified stream does not exist, <code>DescribeStream</code>
%% returns a <code>ResourceNotFoundException</code>. If you try to create
%% more shards than are authorized for your account, you receive a
%% <code>LimitExceededException</code>.
%%
%% For the default shard limit for an AWS account, see <a
%% href="http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html">Streams
%% Limits</a> in the <i>Amazon Kinesis Streams Developer Guide</i>. If you
%% need to increase this limit, <a
%% href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">contact
%% AWS Support</a>.
%%
%% If you try to operate on too many streams simultaneously using
%% <a>CreateStream</a>, <a>DeleteStream</a>, <a>MergeShards</a>, and/or
%% <a>SplitShard</a>, you receive a <code>LimitExceededException</code>.
%%
%% <code>SplitShard</code> has limit of 5 transactions per second per
%% account.
split_shard(Client, Input)
  when is_map(Client), is_map(Input) ->
    split_shard(Client, Input, []).
split_shard(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"SplitShard">>, Input, Options).

%%====================================================================
%% Internal functions
%%====================================================================

-spec request(aws_client:aws_client(), binary(), map(), list()) ->
    {ok, Result, {integer(), list(), hackney:client()}} |
    {error, Error, {integer(), list(), hackney:client()}} |
    {error, term()} when
    Result :: map() | undefined,
    Error :: {binary(), binary()}.
request(Client, Action, Input, Options) ->
    Client1 = Client#{service => <<"kinesis">>},
    Host = get_host(<<"kinesis">>, Client1),
    URL = get_url(Host, Client1),
    Headers = [{<<"Host">>, Host},
               {<<"Content-Type">>, <<"application/x-amz-json-1.1">>},
               {<<"X-Amz-Target">>, << <<"Kinesis_20131202.">>/binary, Action/binary>>}],
    Payload = jsx:encode(Input),
    Headers1 = aws_request:sign_request(Client1, <<"POST">>, URL, Headers, Payload),
    Response = hackney:request(post, URL, Headers1, Payload, Options),
    handle_response(Response).

request_vega(Client, Action, HashToken, Method) ->
    Client1 = Client#{service => Action},
    Host = get_vega_host(<<"">>, Client1),
    URL = get_vega_url(Host, Client1),
    [SHost, _] = binary:split(Host, <<"/">>),
    Headers = [{<<"Host">>, SHost},
    {<<"Content-Type">>, <<"application/octet-stream">>}],
    aws_request:sign_request(Client1, Method, URL, Headers, HashToken).

request_copy(Client, Action, Source, Method) ->
    Client1 = Client#{service => Action},
    Host = get_vega_host(<<"">>, Client1),
    URL = get_vega_url(Host, Client1),
    [SHost, _] = binary:split(Host, <<"/">>),
    Headers = [{<<"Host">>, SHost}],
    Headers1 = aws_request:sign_request_copy(Client1, Method, URL, Source, Headers),
    Response = hackney:request(put, URL, Headers1, [], []),
    handle_response(Response).


request_delete(Client, Action, Method) ->
  Client1 = Client#{service => Action},
  Host = get_vega_host(<<"">>, Client1),
  URL = get_vega_url(Host, Client1),
  [SHost, _] = binary:split(Host, <<"/">>),
  Headers = [{<<"Host">>, SHost}, {<<"Content-Type">>, <<"text/plain">>}],
  Headers1 = aws_request:sign_request_delete(Client1, Method, URL, Headers),
  hackney:request(delete, URL, Headers1, [], []).


handle_response({ok, 200, ResponseHeaders, Client}) ->
    case hackney:body(Client) of
        {ok, <<>>} ->
            {ok, undefined, {200, ResponseHeaders, Client}};
        {ok, Body} ->
            Result = jsx:decode(Body, [return_maps]),
            {ok, Result, {200, ResponseHeaders, Client}}
    end;
handle_response({ok, StatusCode, ResponseHeaders, Client}) ->
    %{ok, Body} = hackney:body(Client),
    % Error = jsx:decode(Body, [return_maps]),
    % Exception = maps:get(<<"__type">>, Error, undefined),
    % Reason = maps:get(<<"message">>, Error, undefined),
    %{error, {Exception, Reason}, {StatusCode, ResponseHeaders, Client}};
    {error, {<<"error">>, <<"error">>}, {StatusCode, ResponseHeaders, Client}};
handle_response({error, Reason}) ->
    {error, Reason}.

get_host(_EndpointPrefix, #{region := <<"local">>}) ->
    <<"localhost">>;

get_host(EndpointPrefix, #{region := Region, endpoint := Endpoint}) ->
    aws_util:binary_join([EndpointPrefix,
                         <<".">>,
                         Region,
                         <<".">>,
                         Endpoint],
                        <<"">>).

get_vega_host(EndpointPrefix, #{endpoint := Endpoint}) ->
  aws_util:binary_join([EndpointPrefix, Endpoint], <<"">>).

get_url(Host, Client) ->
    Proto = maps:get(proto, Client),
    Port = maps:get(port, Client),
    aws_util:binary_join([Proto, <<"://">>, Host, <<":">>, Port, <<"/">>],
        <<"">>).

get_vega_url(Host, Client) ->
  Proto = maps:get(proto, Client),
  aws_util:binary_join([Proto, <<"://">>, Host],<<"">>).