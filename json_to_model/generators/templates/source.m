// Generated by json_to_model

#import "{{ class_name }}.h"

@implementation {{ class_name }}  {

}

- (id)initWithJSONDictionary:(NSDictionary *)dictionary {
{% if super_name == 'NSObject' %}
    self = [super init];
    if (![dictionary isKindOfClass:[NSDictionary class]])
        return nil;
{% else %}
    self = [super initWithJSONDictionary:dictionary];
    if (self == nil)
        return nil;
{% endif %}
    if (self) {
{% for property in properties %} {% if property.type == 'NSInteger' %}
        self.{{ property.name }} = (dictionary[@"{{ property.original_name }}"] != [NSNull null]) ? [dictionary[@"{{ property.original_name }}"] integerValue] : 0;
{% elif property.type == 'CGFloat' %}
        self.{{ property.name }} = (dictionary[@"{{ property.original_name }}"] != [NSNull null]) ? [dictionary[@"{{ property.original_name }}"] floatValue] : 0;
{% elif property.type == 'BOOL' %}
        self.{{ property.name }} = (dictionary[@"{{ property.original_name }}"] != [NSNull null]) ? [dictionary[@"{{ property.original_name }}"] boolValue] : NO;
{% elif property.type == 'NSString *' %}
        self.{{ property.name }} = (dictionary[@"{{ property.original_name }}"] != [NSNull null]) ? dictionary[@"{{ property.original_name }}"] : nil;
{% elif property.type == 'NSArray *' %}
        self.{{ property.name }} = [[NSMutableArray alloc] initWithCapacity:16];
        for (NSDictionary *_ in dictionary[@"{{ property.original_name }}"]) {
            {% if property.children_type.split(' ')[0] in ['NSString', 'NSArray'] %}
                [((NSMutableArray *)self.{{ property.name }}) addObject:_];
            {% elif property.children_type.split(' ')[0] in ['NSInteger', 'BOOL', 'CGFloat'] %}
                [((NSMutableArray *)self.{{ property.name }}) addObject:_];
            {% else %}
                [((NSMutableArray *)self.{{ property.name }}) addObject:[[{{ property.children_type.split(' ')[0] }} alloc] initWithJSONDictionary:_]];
            {% endif %}
        }
{% else %}
        self.{{ property.name }} = (dictionary[@"{{ property.original_name }}"] == [NSNull null] || dictionary[@"{{ property.original_name }}"] == nil) ? nil : [[{{ property.type.split(' ')[0] }} alloc] initWithJSONDictionary: dictionary[@"{{ property.original_name }}"]];
{% endif %} {% endfor %}
    }
    return self;
}

- (id)initWithJSONData:(NSData *)data {
    self = [super init];
    if (self) {
        NSError *error = nil;
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (result) {
            self = [self initWithJSONDictionary:result];
        } else {
            return nil;
        }
    }
    return self;
}

- (NSDictionary *)JSONDictionary {
{% if super_name == 'NSObject' %}
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
{% else %}
    NSMutableDictionary *dictionary = (NSMutableDictionary *)[super JSONDictionary];
{% endif %}
{% for property in properties %} {% if property.type == 'NSInteger' %}
    dictionary[@"{{ property.original_name }}"] = @(self.{{ property.name }});
{% elif property.type == 'CGFloat' %}
    dictionary[@"{{ property.original_name }}"] = @(self.{{ property.name }});
{% elif property.type == 'BOOL' %}
    dictionary[@"{{ property.original_name }}"] = @(self.{{ property.name }});
{% elif property.type == 'NSString *' %}
    dictionary[@"{{ property.original_name }}"] = (self.{{ property.name }} != nil) ? self.{{ property.name }} : [NSNull null];
{% elif property.type == 'NSArray *' %}
    {
        NSMutableArray *_ = [[NSMutableArray alloc] init];
        dictionary[@"{{ property.original_name }}"] = _;
        {% if property.children_type.split(' ')[0] in ['NSInteger', 'BOOL', 'CGFloat'] %}
        for (NSNumber *__ in self.{{ property.name }}) {
            [_ addObject:__];
        }
        {% else %}
        for ({{ property.children_type.split(' ')[0] }} *__ in self.{{ property.name }}) {
            {% if property.children_type.split(' ')[0] in ['NSString', 'NSArray'] %}
                [_ addObject:__];
            {% else %}
                [_ addObject:[__ JSONDictionary]];
            {% endif %}
        }
        {% endif %}
    }
{% else %}
    dictionary[@"{{ property.original_name }}"] = (self.{{ property.name }} == nil) ? [NSNull null] : self.{{ property.name }};
{% endif %} {% endfor %}
    return dictionary;
}


- (NSData *)JSONData {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self JSONDictionary] options:0 error:&error];
    if (error) {
        @throw error;
    }
    return data;
}


@end
